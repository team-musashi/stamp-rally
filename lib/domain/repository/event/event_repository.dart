import 'package:flutter_riverpod/flutter_riverpod.dart';

/// イベントリポジトリプロバイダー
final eventRepositoryProvider = Provider<EventRepository>(
  (_) => throw UnimplementedError('Provider was not initialized'),
);

/// イベントリポジトリ
abstract class EventRepository {
  /// スタンプラリーに参加する
  ///
  /// param_1：ユーザID
  /// param_2：参加するスタンプラリーのID
  Future<void> entryStampRally({
    required String? uid,
    required String stampRallyId,
  });
}
