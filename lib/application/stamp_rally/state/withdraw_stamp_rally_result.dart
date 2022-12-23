import 'package:flutter_riverpod/flutter_riverpod.dart';

/// スタンプラリー中断結果プロバイダー
final withdrawStampRallyResultProvider = StateProvider<AsyncValue<void>>(
  (_) => const AsyncValue.data(null),
  name: 'withdrawStampRallyResultProvider',
);
