import 'package:flutter_riverpod/flutter_riverpod.dart';

/// スタンプラリー参加結果プロバイダー
final entryStampRallyResultProvider = StateProvider<AsyncValue<void>>(
  (_) => const AsyncValue.data(null),
  name: 'entryStampRallyResultProvider',
);
