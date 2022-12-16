import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../../domain/repository/stamp_rally/stamp_rally_repository.dart';
import 'stamp_rally_param.dart';

/// 現在の参加完了済のスタンプラリーパラメータ
final currentCompleteStampRallyParamProvider =
    Provider.autoDispose<StampRallyParam>(
  (_) => throw UnimplementedError('Provider was not initialized'),
  name: 'currentCompleteStampRallyParamProvider',
);

/// 現在の参加完了済のスタンプラリー
final currentPublicStampRallyProvider = FutureProvider.autoDispose<StampRally>(
  (ref) async {
    // 現在の参加完了済のスタンプラリーパラメータを取得する
    final param = ref.watch(currentCompleteStampRallyParamProvider);

    // キャッシュが無ければ取得し直す
    var stampRally = param.cache;
    if (stampRally == null) {
      // 一覧画面で取得済みのスタンプラリー一覧から取得し直す
      final stampRallies = await ref.watch(completeStampRalliesProvider.future);
      stampRally = stampRallies.firstWhere((s) => s.id == param.stampRallyId);
    }

    // スポットのリストを取得してスタンプラリーにマージする
    final spots =
        await ref.watch(entrySpotsProviderFamily(param.stampRallyId).future);
    return stampRally.copyWith(
      spots: spots,
    );
  },
  dependencies: [
    currentCompleteStampRallyParamProvider,
  ],
  name: 'currentCompleteStampRallyParamProvider',
);
