import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repository/stamp_rally/entity/stamp_rally.dart';

/// スタンプラリー参加結果プロバイダー
final entryStampRallyResultProvider = StateProvider<AsyncValue<StampRally?>>(
  (_) => const AsyncValue.data(null),
  name: 'entryStampRallyResultProvider',
);
