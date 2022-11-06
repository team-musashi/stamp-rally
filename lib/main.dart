import 'package:flutter/material.dart';

import 'map_package_sample/map_package_samples_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MapPackageSamples(),
    );
  }
}
