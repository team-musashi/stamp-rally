import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repository/stamp_rally/entity/spot.dart';
import 'current_entry_stamp_rally.dart';
import 'spot_param.dart';

/// 現在の参加中のスポットパラメータ
final currentEntrySpotParamProvider = Provider.autoDispose<SpotParam>(
  (_) => throw UnimplementedError('Provider was not initialized'),
  name: 'currentEntrySpotParamProvider',
);

/// 現在の参加中のスポット
final currentEntrySpotProvider = FutureProvider.autoDispose<Spot>(
  (ref) async {
    // 現在の参加中のスポットパラメータを取得する
    final param = ref.watch(currentEntrySpotParamProvider);

    // キャッシュが無ければ取得し直す
    var spot = param.cache;
    if (spot == null) {
      // 現在のスタンプラリーから取得し直す
      final stampRally = await ref.watch(currentEntryStampRallyProvider.future);
      spot = stampRally!.spots.firstWhere((s) => s.id == param.spotId);
    }
    return spot;
  },
  dependencies: [
    currentEntrySpotParamProvider,
  ],
  name: 'currentEntrySpotProvider',
);
