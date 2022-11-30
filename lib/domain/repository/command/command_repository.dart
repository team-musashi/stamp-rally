import 'package:flutter_riverpod/flutter_riverpod.dart';

/// コマンドリポジトリプロバイダー
final commandRepositoryProvider = Provider<CommandRepository>(
  (_) => throw UnimplementedError('Provider was not initialized'),
);

/// コマンドリポジトリ
abstract class CommandRepository {
  /// スタンプラリーに参加する
  ///
  /// param_1：ユーザID
  /// param_2：参加するスタンプラリーのID
  Future<void> entryStampRally({
    required String? uid,
    required String stampRallyId,
  });
}
