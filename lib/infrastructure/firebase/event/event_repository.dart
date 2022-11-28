import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/repository/event/event_repository.dart';
import 'document/event_document.dart';

/// Firebase イベントリポジトリ
class FirebaseEventRepository implements EventRepository {
  FirebaseEventRepository({required this.store});

  final FirebaseFirestore store;

  static const eventCollectionName = 'event';

  @override
  Future<void> entryStampRally({
    required String? uid,
    required String stampRallyId,
  }) async {
    await store.collection(eventCollectionName).add(
          EventDocument.entryStampRally(
            uid: uid,
            stampRallyId: stampRallyId,
          ).toJson(),
        );
  }
}
