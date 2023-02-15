import 'package:flutter/services.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
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
    final loggedIn = await ref.read(loggedInProvider.future);
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
      final user = await ref.refresh(userStreamProvider.future);
      assert(user != null);

      // ユーザードキュメントが追加されたらユーザーを更新する
      await userRepository.updateUser(
        UserInputData(
          platform: AppPlatform.currentPlatform,
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

  Future<bool> get signedIn async {
    final storedAccessToken = await LineSDK.instance.currentAccessToken;
    if (storedAccessToken == null) {
      return false;
    }
    return storedAccessToken.value.isNotEmpty;
  }

  Future<LoginResult?> signIn() async {
    LoginResult result;
    try {
      result = await LineSDK.instance.login(
        option: LoginOption(false, 'agressive'),
      );
    } on PlatformException catch (e) {
      var message = 'エラーが発生しました';
      if (e.code == '3003') {
        message = 'キャンセルしました';
      }
      throw PlatformException(code: e.code, message: message);
    }
    print(result);
    return result;
  }
}
