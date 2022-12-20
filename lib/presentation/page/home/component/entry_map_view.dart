import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../application/geolocator/geolocator_service.dart';
import '../../../../application/stamp_rally/state/current_entry_stamp_rally.dart';
import '../../../../application/stamp_rally/state/pin_icon_provider.dart';
import '../../../../domain/entity/app_info.dart';
import '../../../../domain/repository/stamp_rally/entity/spot.dart';
import '../../../component/async_value_handler.dart';
import 'entry_spot_index_list.dart';

/// 参加中スタンプラリーのスポットマップ表示用View
class EntryMapView extends ConsumerStatefulWidget {
  const EntryMapView({super.key});

  @override
  _EntryMapViewState createState() => _EntryMapViewState();
}

class _EntryMapViewState extends ConsumerState<EntryMapView> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return AsyncValueHandler(
      value: ref.watch(currentEntryStampRallyProvider),
      builder: (stampRally) {
        final spots = stampRally.spots;
        if (spots.isEmpty) {
          return Container();
        }
        return Scaffold(
          body: Stack(
            children: [
              AsyncValueHandler(
                value: ref.watch(pinIconProvider),
                builder: (icon) {
                  createPolyPoints(spots);
                  return GoogleMap(
                    polylines: {
                      Polyline(
                        polylineId: const PolylineId('route'),
                        points: polylineCoordinates,
                        width: 4,
                        color: Theme.of(context).colorScheme.primaryContainer,
                      )
                    },
                    myLocationEnabled: true,
                    zoomControlsEnabled: false,
                    onMapCreated: onMapCreated,
                    myLocationButtonEnabled: false,
                    markers: createMarkersFromSpots(spots, icon),
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        spots.first.location.latitude,
                        spots.first.location.longitude,
                      ),
                      zoom: 14,
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: EntrySpotIndexList(
                    // 選択中スポットを受け取って本コンポーネント（参加中マップView）側で画面の更新を行う
                    onIndexChanged: onIndexChanged,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// マップの初期構築
  Future<void> onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller);
    final value = await rootBundle.loadString('assets/json/map_style.json');
    final futureController = await _controller.future;
    await futureController.setMapStyle(value); // Controllerを使ってMapをSetする
  }

  List<LatLng> polylineCoordinates = [];

  /// 経路表示用のLineを生成する
  Future<void> createPolyPoints(List<Spot> spots) async {
    if (spots.isEmpty || polylineCoordinates.isNotEmpty) {
      return;
    }

    final polylinePoints = PolylinePoints();

    for (var i = 0; i < spots.length - 1; i++) {
      late PointLatLng pointFrom;
      late PointLatLng pointTo;
      final currentPosition =
          ref.read(geolocatorServiceProvider).getCurrentPosition;
      if (i == 0 && currentPosition != null) {
        // 自分の位置〜1番最初のスポットまでの経路を求める
        pointFrom = PointLatLng(
          currentPosition.latitude,
          currentPosition.longitude,
        );
        pointTo = PointLatLng(
          spots[i].location.latitude,
          spots[i].location.longitude,
        );
      } else {
        // i番目〜その次のスポットまでの経路を求める
        pointFrom = PointLatLng(
          spots[i].location.latitude,
          spots[i].location.longitude,
        );
        pointTo = PointLatLng(
          spots[i + 1].location.latitude,
          spots[i + 1].location.longitude,
        );
      }

      // Directions APIを用いて２点間の最適な経路を求める
      final result = await polylinePoints.getRouteBetweenCoordinates(
        ref.read(appInfoProvider).googleMapAPIKey,
        pointFrom,
        pointTo,
        travelMode: TravelMode.walking,
        avoidHighways: true,
        avoidTolls: true,
      );

      if (result.points.isNotEmpty) {
        for (final point in result.points) {
          polylineCoordinates.add(
            LatLng(point.latitude, point.longitude),
          );
        }
      }
    }

    setState(() {});
  }

  /// 参加中スタンプラリーのスポットからマップに表示するマーカーを生成する
  Set<Marker> createMarkersFromSpots(List<Spot> spots, BitmapDescriptor icon) {
    final markers = <Marker>{};
    for (final spot in spots) {
      markers.add(
        Marker(
          infoWindow: InfoWindow(title: spot.title),
          markerId: MarkerId(spot.id),
          icon: icon,
          position: LatLng(spot.location.latitude, spot.location.longitude),
        ),
      );
    }
    return markers;
  }

  /// スポットカード変更時処理
  ///
  /// 選択中スポットを元にしてマップ上のカメラを移動する
  Future<void> onIndexChanged(Spot spot) async {
    final controller = await _controller.future;
    await controller.showMarkerInfoWindow(MarkerId(spot.id));
    await controller.animateCamera(
      CameraUpdate.newLatLngZoom(
        LatLng(spot.location.latitude, spot.location.longitude),
        17,
      ),
    );
  }
}
