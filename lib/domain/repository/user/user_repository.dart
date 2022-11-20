import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'entity/user.dart';
import 'entity/user_input_data.dart';

/// ユーザープロバイダー
final userProvider = StreamProvider(
  (ref) => ref.watch(userRepositoryProvider).userChanges(),
  name: 'userProvider',
);

/// ログイン中かどうかを返すプロバイダー
final loggedInProvider = StreamProvider(
  (ref) => ref.watch(userRepositoryProvider).loggedInChanges(),
  name: 'loggedInProvider',
);

/// ユーザーリポジトリプロバイダー
final userRepositoryProvider = Provider<UserRepository>(
  (ref) => throw UnimplementedError('Provider was not initialized'),
);

/// ユーザーリポジトリ
///
/// ユーザーの認証に関する操作やユーザー情報の取得や更新を行う
abstract class UserRepository {
  /// ログイン中かどうかを返す
  Stream<bool> loggedInChanges();

  /// 匿名認証でログインする
  Future<void> loginAnonymously();

  /// ログアウトする
  Future<void> logout();

  /// ユーザーを削除する
  Future<void> deleteUser();

  /// ユーザーを返す
  Stream<User?> userChanges();

  /// ユーザーを更新する
  Future<void> updateUser(UserInputData inputData);
}
