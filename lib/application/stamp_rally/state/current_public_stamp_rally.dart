import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../../domain/repository/stamp_rally/stamp_rally_repository.dart';
import 'stamp_rally_param.dart';

/// 現在の公開中のスタンプラリーパラメータ
final currentPublicStampRallyParamProvider =
    Provider.autoDispose<StampRallyParam>(
  (_) => throw UnimplementedError('Provider was not initialized'),
  name: 'currentPublicStampRallyParamProvider',
);

/// 現在の公開中のスタンプラリー
final currentPublicStampRallyProvider = FutureProvider.autoDispose<StampRally>(
  (ref) async {
    // 現在の公開中のスタンプラリーパラメータを取得する
    final param = ref.watch(currentPublicStampRallyParamProvider);

    // キャッシュが無ければ取得し直す
    var stampRally = param.cache;
    if (stampRally == null) {
      // 一覧画面で取得済みのスタンプラリー一覧から取得し直す
      final stampRallies = await ref.watch(publicStampRalliesProvider.future);
      stampRally = stampRallies.firstWhere((s) => s.id == param.stampRallyId);
    }

    // スポットのリストを取得してスタンプラリーにマージする
    final spots =
        await ref.watch(publicSpotsProviderFamily(param.stampRallyId).future);
    return stampRally.copyWith(
      spots: spots,
    );
  },
  // router で currentPublicStampRallyParamProvider を override しているため
  // dependencies で指定してあげないとエラーになる
  dependencies: [
    currentPublicStampRallyParamProvider,
  ],
  name: 'currentPublicStampRallyProvider',
);
