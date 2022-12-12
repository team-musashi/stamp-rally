import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

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
  }

  FirebaseFirestore? get firestore => userDocRef?.firestore;
  final DocumentReference<Map<String, dynamic>>? userDocRef;
  final _publicChangesController =
      StreamController<List<StampRally>>.broadcast();
  final _entryChangesController = StreamController<StampRally?>.broadcast();

  /// コレクションの監視をキャンセルするために保持
  StreamSubscription<QuerySnapshot<StampRallyDocument>>? _publicSubscription;
  StreamSubscription<QuerySnapshot<StampRallyDocument>>? _entrySubscription;

  /// キャッシュ
  List<StampRally>? _cachePublicStampRallies;
  StampRally? _cacheEntryStampRally;

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
      .withConverter<StampRallyDocument>(
        fromFirestore: (snapshot, options) {
          final json = snapshot.data();
          return StampRallyDocument.fromJson(json!);
        },
        toFirestore: (_, __) {
          // 更新することは無いため空実装
          return <String, dynamic>{};
        },
      )
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
          .where(
            StampRallyDocument.field.status,
            isEqualTo: StampRallyEntryStatus.entry.name,
          )
          .orderBy(StampRallyDocument.field.createdAt, descending: true)
          .limit(1)
          .withConverter<StampRallyDocument>(
        fromFirestore: (snapshot, options) {
          final json = snapshot.data();
          return StampRallyDocument.fromJson(json!);
        },
        toFirestore: (_, __) {
          return <String, dynamic>{};
        },
      );

  void dispose() {
    _publicSubscription?.cancel();
    _entrySubscription?.cancel();
    _publicChangesController.close();
    _entryChangesController.close();
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
          return SpotDocument.fromJson(json).toSpot(docId: query.id);
        }).toList() ??
        [];
  }

  @override
  Future<List<Spot>> fetchEntrySpots({
    required String entryStampRallyId,
  }) async {
    final snapshot = await userDocRef
        ?.collection(entryStampRallyCollectionName)
        .doc(entryStampRallyId)
        .collection(entrySpotCollectionName)
        .orderBy(SpotDocument.field.order, descending: false)
        .get();
    return snapshot?.docs.map((query) {
          final json = query.data();
          return SpotDocument.fromJson(json).toSpot(docId: query.id);
        }).toList() ??
        [];
  }
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
      explanation: explanation,
      place: place,
      requiredTime: requiredTime,
      imageUrl: imageUrl,
      status: StampRallyEntryStatus.nameOf(status),
      startDate: startDate,
      endDate: endDate,
    );
  }
}
