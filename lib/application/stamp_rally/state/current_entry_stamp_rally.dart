import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../../domain/repository/stamp_rally/entity/stamp_rally_entry_status.dart';
import '../../../domain/repository/stamp_rally/stamp_rally_repository.dart';
import 'stamp_rally_param.dart';

/// 現在の参加中のスタンプラリーパラメータ
final currentEntryStampRallyParamProvider =
    Provider.autoDispose<StampRallyParam>(
  (_) => throw UnimplementedError('Provider was not initialized'),
  name: 'currentEntryStampRallyParamProvider',
);

/// 現在の参加中のスタンプラリー
final currentEntryStampRallyProvider = FutureProvider.autoDispose<StampRally>(
  (ref) async {
    // 現在の参加中のスタンプラリーパラメータを取得する
    final param = ref.watch(currentEntryStampRallyParamProvider);

    // キャッシュが無ければ取得し直す
    var stampRally = param.cache;
    if (stampRally == null) {
      // 一覧画面で取得済みのスタンプラリー一覧から取得し直す
      final stampRallies = await ref.watch(entryStampRalliesProvider.future);
      stampRally = stampRallies.firstWhere((s) => s.id == param.stampRallyId);
    }

    // スポットのリストを取得してスタンプラリーにマージする
    assert(stampRally.status == StampRallyEntryStatus.entry.name, '参加中のはず');
    final spots =
        await ref.watch(entrySpotsProviderFamily(param.stampRallyId).future);
    return stampRally.copyWith(
      spots: spots,
    );
  },
  dependencies: [
    currentEntryStampRallyParamProvider,
  ],
  name: 'currentEntryStampRallyProvider',
);
