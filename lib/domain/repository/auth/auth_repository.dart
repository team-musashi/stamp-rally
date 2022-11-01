import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'entity/auth_user.dart';

/// 認証リポジトリプロバイダー
final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => throw UnimplementedError('Provider was not initialized'),
  name: 'authRepositoryProvider',
);

/// 認証リポジトリ
abstract class AuthRepository {
  /// 認証ユーザーを返す
  AuthUser? getAuthUser();

  /// 匿名認証でログインする
  Future<AuthUser> loginAnonymously();

  /// ログアウトする
  Future<void> logout();

  /// 認証ユーザーを削除する
  Future<void> delete();
}
