import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repository/stamp_rally/stamp_rally_repository.dart';

/// 参加中のスタンプラリーがあるかを返す
final existsEntryStampRallyProvider = FutureProvider<bool>(
  (ref) async {
    final entryStampRally = await ref.watch(entryStampRallyProvider.future);
    return entryStampRally != null;
  },
);
