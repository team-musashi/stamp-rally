import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'entity/spot.dart';
import 'entity/stamp_rally.dart';

/// 公開中のスタンプラリーリストを返すプロバイダー
final publicStampRalliesProvider = FutureProvider(
  (ref) async {
    final repository = ref.watch(stampRallyRepositoryProvider);
    repository.publicStampRalliesChanges().listen((latest) {
      ref.state = AsyncValue.data(latest);
    });
    return repository.fetchPublicStampRallies();
  },
  name: 'publicStampRalliesProvider',
);

/// 参加中のスタンプラリーを返すStreamプロバイダー
final entryStampRallyStreamProvider = StreamProvider(
  (ref) => ref.watch(stampRallyRepositoryProvider).entryStampRallyChanges(),
  name: 'entryStampRallyStreamProvider',
);

/// 参加中のスタンプラリーを返すプロバイダー
final entryStampRallyProvider = FutureProvider(
  (ref) async {
    final repository = ref.watch(stampRallyRepositoryProvider);
    repository.entryStampRallyChanges().listen((latest) {
      ref.state = AsyncValue.data(latest);
    });
    return repository.fetchEntryStampRally();
  },
  name: 'entryStampRallyProvider',
);

/// 参加完了済のスタンプラリーを返すStreamプロバイダー
final completeStampRallyStreamProvider = StreamProvider(
  (ref) => ref.watch(stampRallyRepositoryProvider).completeStampRallyChanges(),
  name: 'completeStampRallyStreamProvider',
);

/// 参加完了済のスタンプラリーを返すプロバイダー
final completeStampRalliesProvider = FutureProvider(
  (ref) async {
    final repository = ref.watch(stampRallyRepositoryProvider);
    repository.completeStampRallyChanges().listen((latest) {
      ref.state = AsyncValue.data(latest);
    });
    return repository.fetchcompleteStampRally();
  },
  name: 'completeStampRallyProvider',
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
final entrySpotsProviderFamily = FutureProvider.family<List<Spot>, String>(
  (ref, stampRallyId) => ref
      .watch(stampRallyRepositoryProvider)
      .fetchEntrySpots(entryStampRallyId: stampRallyId),
  name: 'entrySpotsProviderFamily',
);

/// 参加完了済のスタンプラリーのスポットリストを返すプロバイダー
final completeSpotsProviderFamily = FutureProvider.family<List<Spot>, String>(
  (ref, stampRallyId) => ref
      .watch(stampRallyRepositoryProvider)
      .fetchCompleteSpots(completeStampRallyId: stampRallyId),
  name: 'completeSpotsProviderFamily',
);

/// スタンプラリーリポジトリプロバイダー
final stampRallyRepositoryProvider = Provider<StampRallyRepository>(
  (_) => throw UnimplementedError('Provider was not initialized'),
);

/// スタンプラリーリポジトリ
abstract class StampRallyRepository {
  /// 公開中のスタンプラリーリストを返す
  Future<List<StampRally>> fetchPublicStampRallies();

  /// 公開中のスタンプラリーリストを返す
  Stream<List<StampRally>> publicStampRalliesChanges();

  /// 参加中のスタンプラリーを返す
  Future<StampRally?> fetchEntryStampRally();

  /// 参加中のスタンプラリーを返す
  Stream<StampRally?> entryStampRallyChanges();

  /// 参加完了済のスタンプラリーを返す
  Future<List<StampRally>> fetchcompleteStampRally();

  /// 参加完了済のスタンプラリーを返す
  Stream<List<StampRally>> completeStampRallyChanges();

  /// 公開中のスタンプラリーに紐づくスポットリストを返す
  Future<List<Spot>> fetchPublicSpots({required String publicStampRallyId});

  /// 参加中のスタンプラリーに紐づくスポットリストを返す
  Future<List<Spot>> fetchEntrySpots({required String entryStampRallyId});

  /// 参加完了済のスタンプラリーに紐づくスポットリストを返す
  Future<List<Spot>> fetchCompleteSpots({required String completeStampRallyId});
}
