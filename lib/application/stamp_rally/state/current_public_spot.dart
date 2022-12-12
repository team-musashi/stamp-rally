import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repository/stamp_rally/entity/spot.dart';
import 'current_public_stamp_rally.dart';
import 'spot_param.dart';

/// 現在の公開中のスポットパラメータ
final currentPublicSpotParamProvider = Provider.autoDispose<SpotParam>(
  (_) => throw UnimplementedError('Provider was not initialized'),
  name: 'currentPublicSpotParamProvider',
);

/// 現在の公開中のスポット
final currentPublicSpotProvider = FutureProvider.autoDispose<Spot>(
  (ref) async {
    // 現在の公開中のスポットパラメータを取得する
    final param = ref.watch(currentPublicSpotParamProvider);

    // キャッシュが無ければ取得し直す
    var spot = param.cache;
    if (spot == null) {
      // 現在のスタンプラリーから取得し直す
      final stampRally =
          await ref.watch(currentPublicStampRallyProvider.future);
      spot = stampRally.spots.firstWhere((s) => s.id == param.spotId);
    }
    return spot;
  },
  dependencies: [
    currentPublicSpotParamProvider,
  ],
  name: 'currentPublicSpotProvider',
);
