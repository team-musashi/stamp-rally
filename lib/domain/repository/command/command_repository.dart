import 'package:flutter_riverpod/flutter_riverpod.dart';

/// コマンドリポジトリプロバイダー
final commandRepositoryProvider = Provider<CommandRepository>(
  (_) => throw UnimplementedError('Provider was not initialized'),
  name: 'commandRepositoryProvider',
);

/// コマンドリポジトリ
abstract class CommandRepository {
  /// スタンプラリーに参加する
  Future<void> enterStampRally({
    required String publicStampRallyId,
  });

  /// スタンプラリーを中断する
  Future<void> withdrawStampRally({
    required String entryStampRallyId,
  });

  /// スタンプラリーを完了する
  Future<void> completeStampRally({
    required String entryStampRallyId,
  });
}
