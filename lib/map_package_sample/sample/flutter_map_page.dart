import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

/// https://pub.dev/packages/flutter_map
class FlutterMapPage extends StatefulWidget {
  const FlutterMapPage({super.key});

  @override
  State<FlutterMapPage> createState() => _FlutterMapPageState();
}

class _FlutterMapPageState extends State<FlutterMapPage> {
  List<CircleMarker> circleMarkers = [];
  List<Marker> markers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('flutter_map')),
      body: FlutterMap(
        // マップ表示設定
        options: MapOptions(
          center: LatLng(35.689, 139.692),
          zoom: 14,
          onTap: (tapPosition, point) {
            final marker = Marker(
              point: point,
              width: 80,
              height: 80,
              builder: (context) => Container(
                child: const IconButton(
                  icon: Icon(
                    Icons.location_on,
                    size: 40,
                    color: Colors.red,
                  ),
                  onPressed: null,
                ),
              ),
            );
            markers.add(marker);
            setState(() {});
          },
        ),
        nonRotatedChildren: [
          AttributionWidget.defaultWidget(
            source: 'OpenStreetMap contributors',
          ),
        ],
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(
            markers: markers,
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initLocation();
  }

  Future<void> initLocation() async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    final latitude = position.latitude;
    final longitude = position.longitude;
    initCircleMarker(latitude, longitude);
    setState(() {});
  }

  void initCircleMarker(double latitude, double longitude) {
    final circleMarler = CircleMarker(
      color: Colors.indigo.withOpacity(0.9),
      radius: 10,
      borderColor: Colors.white.withOpacity(0.9),
      borderStrokeWidth: 3,
      point: LatLng(latitude, longitude),
    );
    circleMarkers.add(circleMarler);
  }
}
