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

    // キャッシュを返してしまうと currentEntryStampRallyProvider.future が実行されず、
    // スポット画像をアップロードすると参加中スポットが更新されても発火しなくなるため
    // キャッシュがあっても現在のスタンプラリーから取得し直す。
    final stampRally = await ref.watch(currentEntryStampRallyProvider.future);
    return stampRally!.spots.firstWhere((s) => s.id == param.spotId);
  },
  dependencies: [
    currentEntrySpotParamProvider,
  ],
  name: 'currentEntrySpotProvider',
);
