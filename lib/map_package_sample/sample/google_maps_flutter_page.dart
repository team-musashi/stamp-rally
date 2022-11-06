import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// https://pub.dev/packages/google_maps_flutter
class GoogleMapsFlutterPage extends StatefulWidget {
  const GoogleMapsFlutterPage({super.key});

  @override
  _GoogleMapsFlutterPage createState() => _GoogleMapsFlutterPage();
}

class _GoogleMapsFlutterPage extends State<GoogleMapsFlutterPage> {
  late GoogleMapController mapController;

  final LatLng _initPosition = const LatLng(35.689, 139.692);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('google_maps_flutter'),
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          initialCameraPosition: CameraPosition(
            target: _initPosition,
            zoom: 11,
          ),
        ),
      ),
    );
  }
}
