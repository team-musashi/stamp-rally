import 'package:flutter_riverpod/flutter_riverpod.dart';

/// コマンドリポジトリプロバイダー
final commandRepositoryProvider = Provider<CommandRepository>(
  (_) => throw UnimplementedError('Provider was not initialized'),
  name: 'commandRepositoryProvider',
);

/// コマンドリポジトリ
abstract class CommandRepository {
  /// スタンプラリーに参加する
  Future<void> entryStampRally({
    required String publicStampRallyId,
  });

  /// スタンプラリーを完了する
  Future<void> completeStampRally({
    required String entryStampRallyId,
  });
}
