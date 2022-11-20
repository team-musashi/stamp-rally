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
        snapshot.docs.map((doc) => doc.data().toStampRally(doc.id)).toList(),
      );
    });
  }

  final FirebaseFirestore store;
  final _publicChangesController =
      StreamController<List<StampRally>>.broadcast();

  /// コレクションの監視をキャンセルするために保持
  StreamSubscription<QuerySnapshot<StampRallyDocument>>? _publicSubscription;

  /// 公開中のスタンプラリーリストのクエリ
  Query<StampRallyDocument> get _publicQuery =>
      store.collection('publicStampRally').withConverter<StampRallyDocument>(
        fromFirestore: (snapshot, options) {
          final json = snapshot.data();
          return StampRallyDocument.fromJson(json!);
        },
        toFirestore: (_, __) {
          // 更新することは無いため空実装
          return <String, dynamic>{};
        },
      );

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
