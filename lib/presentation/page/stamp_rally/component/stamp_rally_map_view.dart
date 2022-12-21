import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../application/geolocator/state/current_geolocator_position.dart';
import '../../../../application/stamp_rally/state/pin_icon.dart';
import '../../../../domain/entity/app_info.dart';
import '../../../../domain/repository/stamp_rally/entity/spot.dart';
import '../../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import 'map_spot.dart';

/// スタンプラリー詳細のマップ表示
class StampRallyMapView extends ConsumerStatefulWidget {
  const StampRallyMapView({
    super.key,
    required this.stampRally,
  });

  final StampRally stampRally;

  @override
  _StampRallyMapViewState createState() => _StampRallyMapViewState();
}

class _StampRallyMapViewState extends ConsumerState<StampRallyMapView> {
  final Completer<GoogleMapController> mapController = Completer();

  @override
  Widget build(BuildContext context) {
    final spots = widget.stampRally.spots;
    final asyncValue = ref.watch(currentGeolocatorPositionProvider);
    final icon = ref.watch(pinIconProvider);

    // 選択中スポットインデックスを監視してマップ上のカメラを移動する
    ref.listen(currentMapSpotIndexProvider, (previous, next) async {
      final spot = spots[next];
      final controller = await mapController.future;
      await controller.showMarkerInfoWindow(MarkerId(spot.id));
      await controller.animateCamera(
        CameraUpdate.newLatLngZoom(
          LatLng(spot.location.latitude, spot.location.longitude),
          17,
        ),
      );
    });

    return Scaffold(
      body: Stack(
        children: [
          asyncValue.maybeWhen(
            data: (currentPosition) =>
                buildMapView(spots, icon, currentPosition),
            orElse: () => buildMapView(spots, icon, null),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: MapSpotSwiper(
                spots: spots,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMapView(
    List<Spot> spots,
    BitmapDescriptor icon,
    Position? currentPosition,
  ) {
    createPolyPoints(spots, currentPosition);
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
  }

  /// マップの初期構築
  Future<void> onMapCreated(GoogleMapController controller) async {
    mapController.complete(controller);
    final value = await rootBundle.loadString('assets/json/map_style.json');
    final futureController = await mapController.future;
    await futureController.setMapStyle(value); // Controllerを使ってMapをSetする
  }

  List<LatLng> polylineCoordinates = [];

  /// 経路表示用のLineを生成する
  Future<void> createPolyPoints(
    List<Spot> spots,
    Position? currentPosition,
  ) async {
    if (spots.isEmpty || polylineCoordinates.isNotEmpty) {
      return;
    }

    final polylinePoints = PolylinePoints();

    for (var i = 0; i < spots.length - 1; i++) {
      late PointLatLng pointFrom;
      late PointLatLng pointTo;
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
}