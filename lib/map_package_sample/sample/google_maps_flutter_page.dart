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

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11,
          ),
        ),
      ),
    );
  }
}
