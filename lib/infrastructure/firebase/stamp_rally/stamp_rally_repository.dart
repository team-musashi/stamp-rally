import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../../domain/repository/stamp_rally/stamp_rally_repository.dart';
import '../firebase.dart';
import 'document/stamp_rally_document.dart';

/// 公開中コレクション名プロバイダー
final publicStampRallyCollectionNameProvider = Provider(
  (_) => 'publicStampRally',
);

/// 参加中コレクション名プロバイダー
final entryStampRallyCollectionNameProvider = Provider(
  (_) => 'entryStampRally',
);

/// 公開中スタンプラリーコレクションReferenceのプロバイダ
final publicStampRallyCollectionRefProvider =
    Provider<CollectionReference<Map<String, dynamic>>>(
  (ref) => ref
      .watch(firebaseFirestoreProvider)
      .collection(ref.watch(publicStampRallyCollectionNameProvider)),
);

/// Firebase スタンプラリーリポジトリ
class FirebaseStampRallyRepository implements StampRallyRepository {
  FirebaseStampRallyRepository({
    required this.collectionRef,
  }) {
    _changesSubscription = _query.snapshots().listen((snapshot) {
      if (_changesController.isClosed) {
        return;
      }

      _changesController.add(
        snapshot.docs.map((doc) {
          final stampRallyDoc = StampRallyDocument.fromJson(doc.data());
          return stampRallyDoc.toStampRally(doc.id);
        }).toList(),
      );
    });
  }

  final CollectionReference<Map<String, dynamic>> collectionRef;
  final _changesController = StreamController<List<StampRally>>.broadcast();

  /// コレクションの監視をキャンセルするために保持
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? _changesSubscription;

  /// 公開中のスタンプラリーリストのクエリ
  Query<Map<String, dynamic>> get _query => collectionRef;

  void dispose() {
    _changesSubscription?.cancel();
    _changesController.close();
  }

  @override
  Stream<List<StampRally>> changesPublicStampRallies() =>
      _changesController.stream;

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
