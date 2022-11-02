import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repository/user/entity/user.dart';

/// 匿名ユーザーを作成結果プロバイダー
final createUserResultProvider = StateProvider<AsyncValue<User?>>(
  (_) => const AsyncValue.data(null),
  name: 'createUserResultProvider',
);
