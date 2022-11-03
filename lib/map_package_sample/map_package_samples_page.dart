import 'package:flutter/material.dart';
import 'package:stamp_rally/map_package_sample/sample/flutter_google_places_page.dart';
import 'package:stamp_rally/map_package_sample/sample/flutter_osm_plugin_page.dart';
import 'package:stamp_rally/map_package_sample/sample/mapbox_search_page.dart';
import 'package:stamp_rally/map_package_sample/sample/place_picker_page.dart';

class MapPackageSamples extends StatelessWidget {
  const MapPackageSamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('マップ系パッケージをいろいろ試してみる')),
      body: Center(
        child: Column(
          children: [
            // sample１
            ElevatedButton(
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const FlutterGooglePlacesPage()),
                    ),
                child: const Text('flutter_google_places')),

            // sample２
            ElevatedButton(
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FlutterOsmPluginPage()),
                    ),
                child: const Text('flutter_osm_plugin')),

            // sample３
            ElevatedButton(
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PlacePickerPage()),
                    ),
                child: const Text('place_picker')),

            // sample４
            ElevatedButton(
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MapBoxSearchPage()),
                    ),
                child: const Text('mapbox_search')),
          ],
        ),
      ),
    );
  }
}
