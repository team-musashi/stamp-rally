import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// ピンアイコンプロバイダ
final pinIconProvider = FutureProvider<BitmapDescriptor>(
  (_) => BitmapDescriptor.fromAssetImage(
    const ImageConfiguration(devicePixelRatio: 1),
    'assets/images/marker.png',
  ),
);
