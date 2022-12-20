import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../stamp_rally/state/current_entry_spot.dart';

/// カメラやギャラリーから取得して保持中の画像ファイルプロバイダー
final pickedImageProviderFamily = StateProvider.family<File?, String>(
  (ref, spotId) => null,
  name: 'pickedImageProviderFamily',
);

/// 現在の参加中のスポットの画像ファイルプロバイダー
final currentPickedImageProvider = StateProvider.autoDispose<File?>(
  (ref) {
    // 現在の参加中のスポットパラメータを取得する
    final param = ref.watch(currentEntrySpotParamProvider);
    return ref.watch(pickedImageProviderFamily(param.spotId));
  },
  dependencies: [
    currentEntrySpotParamProvider,
    pickedImageProviderFamily,
  ],
  name: 'currentPickedImageProvider',
);
