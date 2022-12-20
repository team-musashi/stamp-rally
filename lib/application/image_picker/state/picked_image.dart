import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// カメラやギャラリーから取得して保持中の画像ファイルプロバイダー
final pickedImageProvider = StateProvider<File?>(
  (_) => null,
  name: 'pickedImageProvider',
);
