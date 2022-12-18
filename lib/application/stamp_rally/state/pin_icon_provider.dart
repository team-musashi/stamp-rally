import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// ピンアイコンプロバイダー
final pinIconProvider = FutureProvider<BitmapDescriptor>((_) {
  return BitmapDescriptor.fromAssetImage(
    const ImageConfiguration(devicePixelRatio: 1, size: Size(10, 10)),
    Platform.isIOS
        ? 'assets/images/marker_ios.png'
        : 'assets/images/marker_android.png',
  );
});
