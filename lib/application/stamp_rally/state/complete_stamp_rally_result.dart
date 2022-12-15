import 'package:flutter_riverpod/flutter_riverpod.dart';

/// スタンプラリー中断結果プロバイダー
final completeStampRallyResultProvider = StateProvider<AsyncValue<void>>(
  (_) => const AsyncValue.data(null),
  name: 'completeStampRallyResultProvider',
);
