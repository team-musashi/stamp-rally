import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/entity/value_object/geo_location.dart';
import '../../../domain/repository/stamp_rally/entity/spot.dart';
import '../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../../domain/repository/stamp_rally/entity/stamp_rally_entry_status.dart';
import '../../../domain/repository/stamp_rally/stamp_rally_repository.dart';
import 'document/spot_document.dart';
import 'document/stamp_rally_document.dart';

/// Firebase スタンプラリーリポジトリ
class FirebaseStampRallyRepository implements StampRallyRepository {
  FirebaseStampRallyRepository({
    required this.userDocRef,
    required this.storage,
  }) {
    if (userDocRef == null) {
      // 未ログイン状態のときは監視しない
      return;
    }

    // 公開中のスタンプラリーリストの変更を監視する
    _publicSubscription = _publicQuery?.snapshots().listen((snapshot) {
      if (_publicChangesController.isClosed) {
        return;
      }

      final latest = snapshot.toStampRallies();
      if (listEquals(latest, _cachePublicStampRallies)) {
        // キャッシュとまったく同じなら変更を通知しない
        return;
      }

      _publicChangesController.add(latest);

      // キャッシュを更新する
      _cachePublicStampRallies = latest;
    });

    // 参加中のスタンプラリーリストの変更を監視する
    _entrySubscription = _entryQuery?.snapshots().listen((snapshot) {
      if (_entryChangesController.isClosed) {
        return;
      }

      final doc = snapshot.docs.firstOrNull;
      final latest = doc?.data().toStampRally(doc.id);
      if (latest == _cacheEntryStampRally) {
        // キャッシュとまったく同じなら変更を通知しない
        return;
      }

      _entryChangesController.add(latest);

      // キャッシュを更新する
      _cacheEntryStampRally = latest;
    });

    // 参加完了済のスタンプラリーリストの変更を監視する
    _completeSubscription = _completeQuery?.snapshots().listen((snapshot) {
      if (_completeChangesController.isClosed) {
        return;
      }

      final latest = snapshot.toStampRallies();
      if (listEquals(latest, _cacheCompleteStampRallies)) {
        // キャッシュとまったく同じなら変更を通知しない
        return;
      }

      _completeChangesController.add(latest);

      // キャッシュを更新する
      _cacheCompleteStampRallies = latest;
    });
  }

  FirebaseFirestore? get firestore => userDocRef?.firestore;
  final DocumentReference<Map<String, dynamic>>? userDocRef;
  final FirebaseStorage storage;

  final _publicChangesController =
      StreamController<List<StampRally>>.broadcast();
  final _entryChangesController = StreamController<StampRally?>.broadcast();
  final _completeChangesController =
      StreamController<List<StampRally>>.broadcast();

  /// コレクションの監視をキャンセルするために保持
  StreamSubscription<QuerySnapshot<StampRallyDocument>>? _publicSubscription;
  StreamSubscription<QuerySnapshot<StampRallyDocument>>? _entrySubscription;
  StreamSubscription<QuerySnapshot<StampRallyDocument>>? _completeSubscription;

  /// キャッシュ
  List<StampRally>? _cachePublicStampRallies;
  StampRally? _cacheEntryStampRally;
  List<StampRally>? _cacheCompleteStampRallies;

  static const publicStampRallyCollectionName = 'publicStampRally';
  static const publicSpotCollectionName = 'publicSpot';
  static const entryStampRallyCollectionName = 'entryStampRally';
  static const entrySpotCollectionName = 'entrySpot';

  /// 公開中のスタンプラリーリストのクエリ
  ///
  /// ＜検索条件＞
  /// WHERE startDate <= now()
  /// ORDER BY startDate ASC
  Query<StampRallyDocument>? get _publicQuery => firestore
      ?.collection(publicStampRallyCollectionName)
      .withStampRallyDocumentConverter()
      .where(
        StampRallyDocument.field.startDate,
        isLessThanOrEqualTo: DateTime.now(),
      )
      .orderBy(StampRallyDocument.field.startDate);

  /// 参加中のスタンプラリーリストのクエリ
  ///
  /// ＜検索条件＞
  /// WHERE status == entry
  /// ORDER BY createdAt DESC
  /// limit 1
  Query<StampRallyDocument>? get _entryQuery => userDocRef
      ?.collection(entryStampRallyCollectionName)
      .withStampRallyDocumentConverter()
      .where(
        StampRallyDocument.field.status,
        isEqualTo: StampRallyEntryStatus.entry.name,
      )
      .orderBy(StampRallyDocument.field.createdAt, descending: true)
      .limit(1);

  /// 参加完了済のスタンプラリーリストのクエリ
  ///
  /// ＜検索条件＞
  /// WHERE status == complete
  /// ORDER BY createdAt DESC
  Query<StampRallyDocument>? get _completeQuery => userDocRef
      ?.collection(entryStampRallyCollectionName)
      .withStampRallyDocumentConverter()
      .where(
        StampRallyDocument.field.status,
        isEqualTo: StampRallyEntryStatus.complete.name,
      )
      .orderBy(StampRallyDocument.field.createdAt, descending: true);

  void dispose() {
    _publicSubscription?.cancel();
    _entrySubscription?.cancel();
    _completeSubscription?.cancel();
    _publicChangesController.close();
    _entryChangesController.close();
    _completeChangesController.close();
  }

  @override
  Future<List<StampRally>> fetchPublicStampRallies() async {
    // キャッシュがあればキャッシュを返す
    final cache = _cachePublicStampRallies;
    if (cache != null) {
      return cache;
    }

    // キャッシュがなければ取得してくる
    final snapshot = await _publicQuery?.get();
    return snapshot?.toStampRallies() ?? [];
  }

  @override
  Stream<List<StampRally>> publicStampRalliesChanges() =>
      _publicChangesController.stream;

  @override
  Future<StampRally?> fetchEntryStampRally() async {
    // キャッシュがあればキャッシュを返す
    final cache = _cacheEntryStampRally;
    if (cache != null) {
      return cache;
    }

    // キャッシュがなければ取得してくる
    final snapshot = await _entryQuery?.get();
    final doc = snapshot?.docs.firstOrNull;
    return doc?.data().toStampRally(doc.id);
  }

  @override
  Stream<StampRally?> entryStampRallyChanges() =>
      _entryChangesController.stream;

  @override
  Stream<List<StampRally>> completeStampRalliesChanges() =>
      _completeChangesController.stream;

  @override
  Future<List<StampRally>> fetchCompleteStampRallies() async {
    // キャッシュがあればキャッシュを返す
    final cache = _cacheCompleteStampRallies;
    if (cache != null) {
      return cache;
    }
    // キャッシュがなければ取得してくる
    final snapshot = await _completeQuery?.get();
    return snapshot?.toStampRallies() ?? [];
  }

  @override
  Future<List<Spot>> fetchPublicSpots({
    required String publicStampRallyId,
  }) async {
    final snapshot = await firestore
        ?.collection(publicStampRallyCollectionName)
        .doc(publicStampRallyId)
        .collection(publicSpotCollectionName)
        .orderBy(SpotDocument.field.order, descending: false)
        .get();
    return snapshot?.docs.map((query) {
          final json = query.data();
          return SpotDocument.fromJson(json).toSpot(
            id: query.id,
            stampRallyId: publicStampRallyId,
            isEntry: false,
          );
        }).toList() ??
        [];
  }

  @override
  Future<List<Spot>> fetchEntrySpots({
    required String entryStampRallyId,
  }) async {
    final snapshot = await _getEntrySpotsQuery(entryStampRallyId)?.get();
    return _convertEntrySpots(entryStampRallyId, snapshot);
  }

  @override
  Stream<List<Spot>>? entrySpotsChanges({
    required String entryStampRallyId,
  }) {
    return _getEntrySpotsQuery(entryStampRallyId)?.snapshots().asyncMap(
      (snapshot) async {
        return _convertEntrySpots(entryStampRallyId, snapshot);
      },
    );
  }

  /// 参加中スポットリストのクエリを返す
  Query<Map<String, dynamic>>? _getEntrySpotsQuery(String entryStampRallyId) {
    return userDocRef
        ?.collection(entryStampRallyCollectionName)
        .doc(entryStampRallyId)
        .collection(entrySpotCollectionName)
        .orderBy(SpotDocument.field.order, descending: false);
  }

  /// 参加中スポットリストに変換する
  Future<List<Spot>> _convertEntrySpots(
    String entryStampRallyId,
    QuerySnapshot<Map<String, dynamic>>? snapshot,
  ) async {
    return Future.wait<Spot>(
      snapshot?.docs.map((query) async {
            final json = query.data();
            final spotDoc = SpotDocument.fromJson(json);
            // パスをURLに変換する
            final url = await _convertSpotImageUrl(spotDoc.uploadImagePath);
            return spotDoc.toSpot(
              id: query.id,
              stampRallyId: entryStampRallyId,
              isEntry: true,
              uploadImageUrl: url,
            );
          }) ??
          [],
    );
  }

  /// アップロードしたスポット画像のURLに変換する
  Future<String?> _convertSpotImageUrl(String? path) async {
    if (path == null) {
      return null;
    }
    return storage.ref(path).getDownloadURL();
  }

  @override
  Future<void> uploadSpotImage({
    required Spot spot,
    required File image,
  }) async {
    // Storageにアップロードする
    final path = _convertSpotImagePath(spot);
    await storage.ref(path).putFile(image);

    // 参加中スポットを更新する
    await _updateEntrySpot(spot: spot, uploadImagePath: path);
  }

  /// アップロードするスポット画像のパスに変換する
  String _convertSpotImagePath(Spot spot) {
    final uid = userDocRef?.id;
    assert(uid != null);

    // 上書き保存しないように現在日時をファイル名に付加する
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    return 'user/$uid/entryStampRally/${spot.stampRallyId}/spot/${spot.id}_$timestamp';
  }

  /// 参加中スポットを更新する
  Future<void> _updateEntrySpot({
    required Spot spot,
    required String uploadImagePath,
  }) async {
    final ref = userDocRef
        ?.collection(entryStampRallyCollectionName)
        .doc(spot.stampRallyId)
        .collection(entrySpotCollectionName)
        .doc(spot.id);

    await ref?.set(
      <String, dynamic>{
        SpotDocument.field.uploadImagePath: uploadImagePath,
        SpotDocument.field.gotDate: DateTime.now(),
      },
      SetOptions(merge: true),
    );
  }
}

extension _CollectionRefferenceEx on CollectionReference<Map<String, dynamic>> {
  /// StampRallyDocumentへ変換するWithConverter
  CollectionReference<StampRallyDocument> withStampRallyDocumentConverter() =>
      withConverter<StampRallyDocument>(
        fromFirestore: (snapshot, options) {
          final json = snapshot.data();
          return StampRallyDocument.fromJson(json!);
        },
        toFirestore: (_, __) {
          // 更新することは無いため空実装
          return <String, dynamic>{};
        },
      );
}

extension _QuerySnapshotEx on QuerySnapshot<StampRallyDocument> {
  /// QuerySnapshot => List<StampRally>
  List<StampRally> toStampRallies() =>
      docs.map((doc) => doc.data().toStampRally(doc.id)).where((stampRally) {
        final endDate = stampRally.endDate;
        if (endDate == null) {
          // 終了日時が無い場合は常に開催中のため表示する
          return true;
        }
        // 終了日時を超えていたら表示しない
        return endDate.isAfter(DateTime.now());
      }).toList();
}

extension _StampRallyDocumentEx on StampRallyDocument {
  /// StampRallyDocument => StampRally
  StampRally toStampRally(String id) {
    return StampRally(
      id: id,
      title: title,
      summary: summary,
      area: area,
      requiredTime: requiredTime,
      imageUrl: imageUrl,
      status: StampRallyEntryStatus.nameOf(status),
      startDate: startDate,
      endDate: endDate,
      route: route ?? <GeoLocation>[],
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
