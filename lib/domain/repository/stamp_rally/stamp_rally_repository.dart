import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'entity/spot.dart';
import 'entity/stamp_rally.dart';

/// 公開中のスタンプラリーリストを返すStreamプロバイダー
final _publicStampRalliesStreamProvider = StreamProvider(
  (ref) => ref.watch(stampRallyRepositoryProvider).publicStampRalliesChanges(),
);

/// 公開中のスタンプラリーリストを返すプロバイダー
final publicStampRalliesProvider = FutureProvider(
  (ref) async => ref.watch(_publicStampRalliesStreamProvider.future),
  name: 'publicStampRalliesProvider',
);

/// 参加中のスタンプラリーリストを返すStreamプロバイダー
final _entryStampRalliesProvider = StreamProvider(
  (ref) => ref.watch(stampRallyRepositoryProvider).entryStampRalliesChanges(),
);

/// 参加中のスタンプラリーリストを返すプロバイダー
final entryStampRalliesProvider = FutureProvider(
  (ref) async => ref.watch(_entryStampRalliesProvider.future),
  name: 'entryStampRalliesProvider',
);

/// スタンプラリーに参加中であるかどうかを返すプロバイダー
final isEntryProvider = StreamProvider(
  (ref) => ref.watch(stampRallyRepositoryProvider).isEntryChanges(),
  name: 'isEntryProvider',
);

/// 公開中のスタンプラリーのスポットリストを返すプロバイダー
final publicSpotsProviderFamily =
    FutureProvider.autoDispose.family<List<Spot>, String>(
  (ref, stampRallyId) => ref
      .watch(stampRallyRepositoryProvider)
      .fetchPublicSpots(publicStampRallyId: stampRallyId),
  name: 'publicSpotsProviderFamily',
);

/// 参加中のスタンプラリーのスポットリストを返すプロバイダー
final entrySpotsProviderFamily =
    FutureProvider.autoDispose.family<List<Spot>, String>(
  (ref, stampRallyId) => ref
      .watch(stampRallyRepositoryProvider)
      .fetchEntrySpots(entryStampRallyId: stampRallyId),
  name: 'entrySpotsProviderFamily',
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

  /// スタンプラリーに参加中であるかどうかを返す
  Stream<bool> isEntryChanges();

  /// 公開中のスタンプラリーに紐づくスポットリストを返す
  Future<List<Spot>> fetchPublicSpots({required String publicStampRallyId});

  /// 参加中のスタンプラリーに紐づくスポットリストを返す
  Future<List<Spot>> fetchEntrySpots({required String entryStampRallyId});
}
