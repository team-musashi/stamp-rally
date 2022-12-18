import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'entity/spot.dart';
import 'entity/stamp_rally.dart';
import 'entity/upload_image.dart';

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

/// ストレージに画像をアップロードするプロバイダー
final uploadImageProviderFamily = FutureProvider.family<void, UploadImage>(
  (ref, uploadImage) => ref
      .watch(stampRallyRepositoryProvider)
      .uploadImage(uploadImage: uploadImage),
  name: 'uploadImageProvider',
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

  /// 公開中のスタンプラリーに紐づくスポットリストを返す
  Future<List<Spot>> fetchPublicSpots({required String publicStampRallyId});

  /// 参加中のスタンプラリーに紐づくスポットリストを返す
  Future<List<Spot>> fetchEntrySpots({required String entryStampRallyId});

  /// Storage に画像をアップロードする
  Future<void> uploadImage({required UploadImage uploadImage});

  /// 参加中のスタンプラリーに紐づく画像リストを返す
  Future<List<File?>> fetchEntryImages();

  /// 完了済みのスタンプラリーに紐づく画像リストを返す
  // Future<List<File?>> fetchCompletedImages();
}
