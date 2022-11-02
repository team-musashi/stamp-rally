import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'entity/user.dart';
import 'entity/user_input_data.dart';

/// ログイン中かどうかを返すプロバイダー
final loggedInProvider = StreamProvider(
  (ref) => ref.watch(userRepositoryProvider).loggedInChanges(),
  name: 'loggedInProvider',
);

/// ユーザープロバイダー
final userProvider = StreamProvider(
  (ref) => ref.watch(userRepositoryProvider).userChanges(),
  name: 'userProvider',
);

/// ユーザーリポジトリプロバイダー
final userRepositoryProvider = Provider<UserRepository>(
  (ref) => throw UnimplementedError('Provider was not initialized'),
);

/// ユーザーリポジトリ
abstract class UserRepository {
  /// ログイン中かどうかを返す
  Stream<bool> loggedInChanges();

  /// 匿名認証でログインする
  Future<void> loginAnonymously();

  /// ログアウトする
  Future<void> logout();

  /// 認証ユーザーを削除する
  Future<void> delete();

  /// ユーザーを返す
  Stream<User?> userChanges();

  /// ユーザーを更新する
  Future<void> updateUser(UserInputData inputData);
}
