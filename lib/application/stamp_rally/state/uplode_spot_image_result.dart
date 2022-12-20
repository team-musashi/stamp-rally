import 'package:flutter_riverpod/flutter_riverpod.dart';

/// スポット画像アップロード結果プロバイダー
final uploadSpotImageResultProvider = StateProvider<AsyncValue<void>>(
  (_) => const AsyncValue.data(null),
  name: 'uploadSpotImageResultProvider',
);
