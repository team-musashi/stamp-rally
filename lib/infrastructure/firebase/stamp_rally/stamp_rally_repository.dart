import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

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

      _publicChangesController.add(
        snapshot.docs
            .map((doc) => doc.data().toStampRally(doc.id))
            .where((stampRally) {
          final endDate = stampRally.endDate;
          if (endDate == null) {
            // 終了日時が無い場合は常に開催中のため表示する
            return true;
          }
          // 終了日時を超えていたら表示しない
          return endDate.isAfter(DateTime.now());
        }).toList(),
      );
    });

    // 参加中のスタンプラリーリストの変更を監視する
    _entrySubscription = _entryQuery?.snapshots().listen((snapshot) {
      if (_entryChangesController.isClosed) {
        return;
      }

      _entryChangesController.add(
        snapshot.docs.map((doc) => doc.data().toStampRally(doc.id)).toList(),
      );
    });
  }

  FirebaseFirestore? get firestore => userDocRef?.firestore;
  final DocumentReference<Map<String, dynamic>>? userDocRef;
  final _publicChangesController =
      StreamController<List<StampRally>>.broadcast();
  final _entryChangesController =
      StreamController<List<StampRally>>.broadcast();

  /// コレクションの監視をキャンセルするために保持
  StreamSubscription<QuerySnapshot<StampRallyDocument>>? _publicSubscription;
  StreamSubscription<QuerySnapshot<StampRallyDocument>>? _entrySubscription;

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
  /// ORDER BY createdAt DESC
  Query<StampRallyDocument>? get _entryQuery => userDocRef
          ?.collection(entryStampRallyCollectionName)
          .withConverter<StampRallyDocument>(
        fromFirestore: (snapshot, options) {
          final json = snapshot.data();
          return StampRallyDocument.fromJson(json!);
        },
        toFirestore: (_, __) {
          return <String, dynamic>{};
        },
      ).orderBy(StampRallyDocument.field.createdAt, descending: true);

  void dispose() {
    _publicSubscription?.cancel();
    _entrySubscription?.cancel();
    _publicChangesController.close();
    _entryChangesController.close();
  }

  @override
  Stream<List<StampRally>> publicStampRalliesChanges() =>
      _publicChangesController.stream;

  @override
  Stream<List<StampRally>> entryStampRalliesChanges() =>
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

extension _StampRallyDocumentEx on StampRallyDocument {
  /// StampRallyDocument => StampRally
  StampRally toStampRally(String id) => _toStampRally(
        id,
      );

  /// StampRallyDocument => StampRally
  StampRally _toStampRally(String id) {
    return StampRally(
      id: id,
      title: title,
      explanation: explanation,
      place: place,
      requiredTime: requiredTime,
      imageUrl: imageUrl,
      status: status,
      startDate: startDate,
      endDate: endDate,
    );
  }
}
