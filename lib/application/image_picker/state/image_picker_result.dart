import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 画像取得結果プロバイダー
final imagePickerResultProvider = StateProvider<AsyncValue<void>>(
  (_) => const AsyncValue.data(null),
  name: 'imagePickerResultProvider',
);
