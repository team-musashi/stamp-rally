import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/repository/stamp_rally/entity/spot.dart';
import '../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../../domain/repository/stamp_rally/stamp_rally_repository.dart';
import 'document/event_document.dart';
import 'document/spot_document.dart';
import 'document/stamp_rally_document.dart';

/// Firebase スタンプラリーリポジトリ
class FirebaseStampRallyRepository implements StampRallyRepository {
  FirebaseStampRallyRepository({
    required this.store,
    this.uid,
  }) {
    if (uid == null) {
      // 未ログイン状態のときは監視しない
      return;
    }

    // 公開中のスタンプラリーリストの変更を監視する
    _publicSubscription = _publicQuery.snapshots().listen((snapshot) {
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
  }

  final FirebaseFirestore store;
  final String? uid;
  final _publicChangesController =
      StreamController<List<StampRally>>.broadcast();

  /// コレクションの監視をキャンセルするために保持
  StreamSubscription<QuerySnapshot<StampRallyDocument>>? _publicSubscription;

  static const eventCollectionName = 'event';
  static const publicStampRallyCollectionName = 'publicStampRally';
  static const spotCollectionName = 'spot';

  /// 公開中のスタンプラリーリストのクエリ
  ///
  /// ＜検索条件＞
  /// WHERE startDate <= now()
  /// ORDER BY startDate ASC
  Query<StampRallyDocument> get _publicQuery => store
      .collection(publicStampRallyCollectionName)
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

  void dispose() {
    _publicSubscription?.cancel();
    _publicChangesController.close();
  }

  @override
  Stream<List<StampRally>> publicStampRalliesChanges() =>
      _publicChangesController.stream;

  @override
  Stream<List<StampRally>> entryStampRalliesChanges() {
    // TODO(cobo): implement changesEntryStampRallies
    throw UnimplementedError();
  }

  @override
  Future<List<Spot>> fetchSpots({required String stampRallyId}) async {
    final snapshot = await store
        .collection(publicStampRallyCollectionName)
        .doc(stampRallyId)
        .collection(spotCollectionName)
        .orderBy(SpotDocument.field.order, descending: false)
        .get();
    return snapshot.docs.map((query) {
      final json = query.data();
      return SpotDocument.fromJson(json).toSpot(docId: query.id);
    }).toList();
  }

  @override
  Future<void> entryStampRally({required String stampRallyId}) async {
    await store.collection(eventCollectionName).add(
          EventDocument.entryStampRally(stampRallyId: stampRallyId).toJson(),
        );
  }
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
      startDate: startDate,
      endDate: endDate,
    );
  }
}
