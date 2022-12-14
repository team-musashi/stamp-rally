import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 画像取得結果プロバイダー
final imagePickerResultProvider = StateProvider<File?>(
  (_) => null,
  name: 'imagePickerResultProvider',
);
