import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'entity/spot.dart';
import 'entity/stamp_rally.dart';

/// 公開中のスタンプラリーリストを返すプロバイダー
final publicStampRalliesProvider = StreamProvider(
  (ref) => ref.watch(stampRallyRepositoryProvider).changesPublicStampRallies(),
  name: 'publicStampRalliesProvider',
);

/// 公開中のスタンプラリーのスポットを返すプロバイダー
final publicSpotsProviderFamily = FutureProvider.family<List<Spot>, String>(
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
  /// 公開中スタンプラリーを返す
  Stream<List<StampRally>> changesPublicStampRallies();

  /// 参加中スタンプラリーを返す
  Stream<List<StampRally>> changesEntryStampRallies();

  /// スタンプラリーに紐づくスポットのリストを返す
  Future<List<Spot>> fetchSpots({required String stampRallyId});
}
