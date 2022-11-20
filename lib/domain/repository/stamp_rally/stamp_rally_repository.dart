import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'entity/stamp_rally.dart';

/// 公開中のスタンプラリーリストを返すプロバイダー
final publicStampRalliesProvider = StreamProvider(
  (ref) => ref.watch(stampRallyRepositoryProvider).changesPublicStampRallies(),
  name: 'publicStampRalliesProvider',
);

/// スタンプラリーリポジトリプロバイダー
final stampRallyRepositoryProvider = Provider<StampRallyRepository>(
  (_) => throw UnimplementedError('Provider was not initialized'),
);

/// スタンプラリーリポジトリ
abstract class StampRallyRepository {
  /// 公開中スタンプラリーを返す
  Stream<List<StampRally>> changesPublicStampRallies();

  /// 参加中スタンプラリーを返す
  Stream<List<StampRally>> changesEntryStampRallies();
}
