import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repository/stamp_rally/entity/stamp_rally.dart';

/// スタンプラリー中断結果プロバイダー
final completeStampRallyResultProvider = StateProvider<AsyncValue<StampRally?>>(
  (_) => const AsyncValue.data(null),
  name: 'completeStampRallyResultProvider',
);
