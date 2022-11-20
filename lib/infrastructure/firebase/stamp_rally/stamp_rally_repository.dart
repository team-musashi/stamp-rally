import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../../domain/repository/stamp_rally/stamp_rally_repository.dart';
import '../firebase.dart';
import 'document/stamp_rally_document.dart';

/// 公開中スタンプラリーコレクションReferenceのプロバイダー
final publicStampRallyCollectionRefProvider = Provider(
  (ref) => ref.watch(firebaseFirestoreProvider),
);

/// Firebase スタンプラリーリポジトリ
class FirebaseStampRallyRepository implements StampRallyRepository {
  FirebaseStampRallyRepository({
    required this.store,
  }) {
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
  final _publicChangesController =
      StreamController<List<StampRally>>.broadcast();

  /// コレクションの監視をキャンセルするために保持
  StreamSubscription<QuerySnapshot<StampRallyDocument>>? _publicSubscription;

  /// 公開中のスタンプラリーリストのクエリ
  ///
  /// ＜検索条件＞
  /// WHERE startDate <= now()
  /// ORDER BY startDate ASC
  Query<StampRallyDocument> get _publicQuery => store
      .collection('publicStampRally')
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
  Stream<List<StampRally>> changesPublicStampRallies() =>
      _publicChangesController.stream;

  @override
  Stream<List<StampRally>> changesEntryStampRallies() {
    // TODO: implement changesEntryStampRallies
    throw UnimplementedError();
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
