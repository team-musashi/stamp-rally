import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'entity/user.dart';

/// ユーザーリポジトリプロバイダー
final userRepositoryProvider = Provider<UserRepository>(
  (ref) => throw UnimplementedError('Provider was not initialized'),
  name: 'userRepositoryProvider',
);

/// ユーザーリポジトリ
abstract class UserRepository {
  /// ユーザーを監視する
  Stream<User?> changes();

  /// ユーザーを返す
  Future<User?> get();
}
