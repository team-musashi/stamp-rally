import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../../domain/repository/stamp_rally/stamp_rally_repository.dart';

/// 現在の参加中のスタンプラリー
final currentEntryStampRallyProvider = FutureProvider<StampRally?>(
  (ref) async {
    // 参加中のスタンプラリーを取得する
    final stampRally = await ref.watch(entryStampRallyProvider.future);
    if (stampRally == null) {
      return null;
    }

    // スポットのリストを取得してスタンプラリーにマージする
    final spots =
        await ref.watch(entrySpotsProviderFamily(stampRally.id).future);
    return stampRally.copyWith(
      spots: spots,
    );
  },
  name: 'currentEntryStampRallyProvider',
);
