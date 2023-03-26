import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ユーザー情報更新結果プロバイダー
final updateUserResultProvider = StateProvider<AsyncValue<void>>(
  (_) => const AsyncValue.data(null),
  name: 'updateUserResultProvider',
);
