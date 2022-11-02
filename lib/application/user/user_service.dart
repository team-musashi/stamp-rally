import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repository/user/user_repository.dart';
import 'state/create_user_result.dart';
import 'state/delete_user_result.dart';

/// ユーザーサービスプロバイダー
final userServiceProvider = Provider(
  UserService.new,
);

/// ユーザーサービス
class UserService {
  const UserService(this.ref);

  final Ref ref;

  /// 匿名ユーザーを作成する
  Future<void> createUser() async {
    // ログイン済みなら何もしない
    final loggedIn = ref.read(loggedInProvider).value == true;
    if (loggedIn) {
      return;
    }

    // ローディング中にする
    ref.read(createUserResultProvider.notifier).state =
        const AsyncValue.loading();

    // 匿名ユーザーでログインする
    await ref.read(userRepositoryProvider).loginAnonymously();

    // Functions がユーザードキュメントを追加するのを待つ
    ref.listen(userProvider, (previous, next) {
      next.whenData((user) {
        if (user != null) {
          // ユーザードキュメントが追加されたら処理を完了する
          ref.read(createUserResultProvider.notifier).state =
              AsyncValue.data(user);
        }
      });
    });
  }

  /// ユーザーを削除する
  Future<void> deleteUser() async {
    final notifier = ref.read(deleteUserResultProvider.notifier);
    notifier.state = const AsyncValue.loading();
    notifier.state = await AsyncValue.guard(() async {
      await ref.read(userRepositoryProvider).delete();
    });
  }
}
