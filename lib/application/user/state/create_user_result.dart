import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 匿名ユーザーを作成結果プロバイダー
final createUserResultProvider = StateProvider<AsyncValue<void>>(
  (_) => const AsyncValue.data(null),
  name: 'createUserResultProvider',
);
