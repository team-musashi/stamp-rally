import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'entity/stamp_rally.dart';

/// スタンプラリーリポジトリプロバイダー
final stampRallyRepositoryProvider = Provider<StampRallyRepository>(
  (_) => throw UnimplementedError('Provider was not initialized'),
);

/// スタンプラリーリポジトリ
///
/// スタンプラリーに関する取得や更新を行う
abstract class StampRallyRepository {
  /// 公開中スタンプラリーを全件取得する
  Stream<List<StampRally>> fetchAllPublicStampRally();

  /// 参加中スタンプラリーを取得する
  Future<List<StampRally>> fetchEntryStampRally();
}
