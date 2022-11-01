import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 匿名ユーザーでログイン結果プロバイダー
final loginAnonymouslyResultProvider = StateProvider<AsyncValue<void>>(
  (_) => const AsyncValue.data(null),
);
