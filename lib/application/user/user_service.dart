import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repository/auth/auth_repository.dart';
import 'state/delete_user_result.dart';
import 'state/login_anonymously_result.dart';

/// ユーザーサービスプロバイダー
final userServiceProvider = Provider(
  UserService.new,
);

/// ユーザーサービス
class UserService {
  const UserService(this.ref);

  final Ref ref;

  /// 匿名ユーザーでログインする
  Future<void> loginAnonymously() async {
    final notifier = ref.read(loginAnonymouslyResultProvider.notifier);
    notifier.state = const AsyncValue.loading();
    notifier.state = await AsyncValue.guard(() async {
      final authUser = ref.read(authRepositoryProvider).getAuthUser();
      if (authUser == null) {
        await ref.read(authRepositoryProvider).loginAnonymously();
      }
    });
  }

  /// ユーザーを削除する
  Future<void> deleteUser() async {
    final notifier = ref.read(deleteUserResultProvider.notifier);
    notifier.state = const AsyncValue.loading();
    notifier.state = await AsyncValue.guard(() async {
      await ref.read(authRepositoryProvider).delete();
    });
  }
}
