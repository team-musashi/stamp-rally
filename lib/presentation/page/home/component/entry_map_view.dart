import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../application/stamp_rally/state/current_entry_stamp_rally.dart';
import '../../../../domain/repository/stamp_rally/entity/spot.dart';
import '../../../component/async_value_handler.dart';
import 'entry_spot_index_list.dart';

/// 参加中スタンプラリーのスポットマップ表示用View
class EntryMapView extends ConsumerWidget {
  const EntryMapView({super.key});

//   @override
//   _EntryMapViewState createState() => _EntryMapViewState();
// }

// class _EntryMapViewState extends ConsumerState<EntryMapView> {
  static final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueHandler(
      value: ref.watch(currentEntryStampRallyProvider),
      builder: (stampRally) {
        return Scaffold(
          body: Stack(
            children: [
              GoogleMap(
                onMapCreated: _controller.complete,
                myLocationButtonEnabled: false,
                markers: createMarkersFromSpots(stampRally.spots),
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    stampRally.spots.first.location.latitude,
                    stampRally.spots.first.location.longitude,
                  ),
                  zoom: 14,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: const EntrySpotIndexList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// 参加中スタンプラリーのスポットからマップに表示するマーカーを生成する
  Set<Marker> createMarkersFromSpots(List<Spot> spots) {
    final markers = <Marker>{};
    for (final spot in spots) {
      markers.add(
        Marker(
          markerId: MarkerId(spot.id),
          position: LatLng(spot.location.latitude, spot.location.longitude),
        ),
      );
    }
    return markers;
  }
}
