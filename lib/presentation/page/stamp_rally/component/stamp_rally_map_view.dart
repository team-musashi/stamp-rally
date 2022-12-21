import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../application/geolocator/state/current_poly_points.dart';
import '../../../../application/stamp_rally/state/pin_icon.dart';
import '../../../../domain/entity/value_object/geo_location.dart';
import '../../../../domain/repository/stamp_rally/entity/spot.dart';
import '../../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../../../util/assets/assets.gen.dart';
import '../../../component/async_value_handler.dart';
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

  /// スポットリスト
  List<Spot> get spots => widget.stampRally.spots;

  /// スポットの座標リスト
  List<GeoLocation> get locations =>
      spots.map((spot) => spot.location).toList();

  @override
  Widget build(BuildContext context) {
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
          AsyncValueHandler(
            value: ref.watch(currentPolylinePointsProvider(locations)),
            builder: (polylinePoints) => _MapView(
              spots: spots,
              mapController: mapController,
              polylinePoints: polylinePoints,
            ),
            loading: () => _MapView(
              spots: spots,
              mapController: mapController,
              polylinePoints: const [],
            ),
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
}

class _MapView extends ConsumerWidget {
  const _MapView({
    required this.spots,
    required this.mapController,
    required this.polylinePoints,
  });

  final List<Spot> spots;
  final Completer<GoogleMapController> mapController;
  final List<LatLng> polylinePoints;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final icon = ref.watch(pinIconProvider);
    return GoogleMap(
      polylines: {
        Polyline(
          polylineId: const PolylineId('route'),
          points: polylinePoints,
          width: 4,
          color: Theme.of(context).colorScheme.primaryContainer,
        )
      },
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      onMapCreated: (controller) async {
        mapController.complete(controller);
        final value = await rootBundle.loadString(Assets.json.mapStyle);
        final futureController = await mapController.future;
        await futureController.setMapStyle(value); // Controllerを使ってMapをSetする
      },
      myLocationButtonEnabled: false,
      // マップに表示するマーカーを生成する
      markers: spots
          .map(
            (spot) => Marker(
              infoWindow: InfoWindow(title: spot.title),
              markerId: MarkerId(spot.id),
              icon: icon,
              position: LatLng(
                spot.location.latitude,
                spot.location.longitude,
              ),
            ),
          )
          .toSet(),
      initialCameraPosition: CameraPosition(
        target: LatLng(
          spots.first.location.latitude,
          spots.first.location.longitude,
        ),
        zoom: 14,
      ),
    );
  }
}
