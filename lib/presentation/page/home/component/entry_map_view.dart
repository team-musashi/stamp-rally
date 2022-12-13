import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// 参加中スタンプラリーのスポットマップ表示用View
class EntryMapView extends StatefulWidget {
  const EntryMapView({super.key});

  @override
  State<EntryMapView> createState() => _EntryMapViewState();
}

class _EntryMapViewState extends State<EntryMapView> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
}
