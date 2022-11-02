import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'entity/auth_user.dart';
import 'entity/user.dart';

/// ユーザーリポジトリプロバイダー
final userRepositoryProvider = Provider<UserRepository>(
  (ref) => throw UnimplementedError('Provider was not initialized'),
  name: 'userRepositoryProvider',
);

/// ユーザーリポジトリ
abstract class UserRepository {
  /// 認証ユーザーを返す
  AuthUser? getAuthUser();

  /// 匿名認証でログインする
  Future<AuthUser> loginAnonymously();

  /// ログアウトする
  Future<void> logout();

  /// 認証ユーザーを削除する
  Future<void> delete();

  /// ユーザーを監視する
  Stream<User?> changes();

  /// ユーザーを返す
  Future<User?> get();
}
