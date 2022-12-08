import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'entity/spot.dart';
import 'entity/stamp_rally.dart';

/// 公開中のスタンプラリーリストを返すプロバイダー
final publicStampRalliesProvider = StreamProvider(
  (ref) => ref.watch(stampRallyRepositoryProvider).publicStampRalliesChanges(),
  name: 'publicStampRalliesProvider',
);

/// 公開中のスタンプラリーのスポットリストを返すプロバイダー
final publicSpotsProviderFamily =
    FutureProvider.autoDispose.family<List<Spot>, String>(
  (ref, stampRallyId) => ref
      .watch(stampRallyRepositoryProvider)
      .fetchSpots(stampRallyId: stampRallyId),
  name: 'publicSpotsProviderFamily',
);

/// スタンプラリーリポジトリプロバイダー
final stampRallyRepositoryProvider = Provider<StampRallyRepository>(
  (_) => throw UnimplementedError('Provider was not initialized'),
);

/// スタンプラリーリポジトリ
abstract class StampRallyRepository {
  /// 公開中のスタンプラリーリストを返す
  Stream<List<StampRally>> publicStampRalliesChanges();

  /// 参加中のスタンプラリーリストを返す
  Stream<List<StampRally>> entryStampRalliesChanges();

  /// 公開中のスタンプラリーに紐づくスポットリストを返す
  Future<List<Spot>> fetchSpots({required String stampRallyId});
}
