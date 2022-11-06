import 'package:flutter/material.dart';

import 'sample/flutter_map_page.dart';
import 'sample/google_maps_flutter_page.dart';

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
              onPressed: () => Navigator.push<void>(
                context,
                MaterialPageRoute(
                  builder: (context) => const GoogleMapsFlutterPage(),
                ),
              ),
              child: const Text('google_maps_flutter'),
            ),

            // sample２
            ElevatedButton(
              onPressed: () => Navigator.push<void>(
                context,
                MaterialPageRoute(
                  builder: (context) => const FlutterMapPage(),
                ),
              ),
              child: const Text('flutter_map'),
            ),
          ],
        ),
      ),
    );
  }
}
