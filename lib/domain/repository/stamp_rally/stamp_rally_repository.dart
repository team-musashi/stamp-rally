import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../user/user_repository.dart';
import 'entity/spot.dart';
import 'entity/stamp_rally.dart';

/// 公開中のスタンプラリーリストを返すプロバイダー
final publicStampRalliesProvider = FutureProvider(
  (ref) async {
    final repository = ref.watch(stampRallyRepositoryProvider);
    final user = await ref.watch(userProvider.future);

    bool shouldFilter() => user!.region != null && user.region != '設定なし';

    // スタンプラリーをリッスンし、条件に一致する場合のみフィルタリング
    repository.publicStampRalliesChanges().listen((latest) {
      final filtered = shouldFilter()
          ? latest
              .where((stampRally) => stampRally.area == user!.region)
              .toList()
          : latest;
      ref.state = AsyncValue.data(filtered);
    });

    // 最初のデータ取得時にもフィルタリングを適用
    final stampRallies = await repository.fetchPublicStampRallies();
    return shouldFilter()
        ? stampRallies
            .where((stampRally) => stampRally.area == user!.region)
            .toList()
        : stampRallies;
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

/// 参加完了済のスタンプラリーリストを返すStreamプロバイダー
final completeStampRalliesStreamProvider = StreamProvider(
  (ref) =>
      ref.watch(stampRallyRepositoryProvider).completeStampRalliesChanges(),
  name: 'completeStampRalliesStreamProvider',
);

/// 参加完了済のスタンプラリーリストを返すプロバイダー
final completeStampRalliesProvider = FutureProvider(
  (ref) async {
    final repository = ref.watch(stampRallyRepositoryProvider);
    repository.completeStampRalliesChanges().listen((latest) {
      ref.state = AsyncValue.data(latest);
    });
    return repository.fetchCompleteStampRallies();
  },
  name: 'completeStampRalliesProvider',
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
  (ref, stampRallyId) async {
    final repository = ref.watch(stampRallyRepositoryProvider);
    repository
        .entrySpotsChanges(entryStampRallyId: stampRallyId)
        ?.listen((latest) {
      ref.state = AsyncValue.data(latest);
    });
    return repository.fetchEntrySpots(entryStampRallyId: stampRallyId);
  },
  name: 'entrySpotsProviderFamily',
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

  /// 参加完了済のスタンプラリーリストを返す
  Future<List<StampRally>> fetchCompleteStampRallies();

  /// 参加完了済のスタンプラリーリストを返す
  Stream<List<StampRally>> completeStampRalliesChanges();

  /// 公開中のスタンプラリーに紐づくスポットリストを返す
  Future<List<Spot>> fetchPublicSpots({required String publicStampRallyId});

  /// 参加中のスタンプラリーに紐づくスポットリストを返す
  Future<List<Spot>> fetchEntrySpots({required String entryStampRallyId});

  /// 参加中のスタンプラリーに紐づくスポットリストを返す
  Stream<List<Spot>>? entrySpotsChanges({required String entryStampRallyId});

  /// 撮影したスポット画像をアップロードする
  Future<void> uploadSpotImage({
    required Spot spot,
    required File image,
  });
}
