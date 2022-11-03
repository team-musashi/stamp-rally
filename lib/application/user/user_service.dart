import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entity/app_platform.dart';
import '../../domain/repository/user/entity/user_input_data.dart';
import '../../domain/repository/user/user_repository.dart';
import 'state/create_user_result.dart';
import 'state/delete_user_result.dart';

/// ユーザーサービスプロバイダー
final userServiceProvider = Provider(
  UserService.new,
);

/// ユーザーサービス
///
/// ユーザーに関する操作を提供する
/// Widget から呼ばれ、各 Repository や State を操作するロジックを実装する
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

    final notifier = ref.read(createUserResultProvider.notifier);
    notifier.state = const AsyncValue.loading();
    notifier.state = await AsyncValue.guard(() async {
      // 匿名ユーザーでログインする
      final userRepository = ref.read(userRepositoryProvider);
      await userRepository.loginAnonymously();

      // Functions がユーザードキュメントを追加するのを待つ
      // ref.read() だとユーザーを再作成（作成→削除→作成）したときに null が返ってきて
      // しまうので、一度 dispose （破棄）させるために ref.refresh() を使う
      final user = await ref.refresh(userProvider.future);
      assert(user != null);

      // ユーザードキュメントが追加されたらユーザーを更新する
      await userRepository.updateUser(
        UserInputData(
          createdPlatform: AppPlatform.currentPlatform,
        ),
      );
    });
  }

  /// ユーザーを削除する
  Future<void> deleteUser() async {
    final notifier = ref.read(deleteUserResultProvider.notifier);
    notifier.state = const AsyncValue.loading();
    notifier.state = await AsyncValue.guard(() async {
      await ref.read(userRepositoryProvider).deleteUser();
    });
  }
}
