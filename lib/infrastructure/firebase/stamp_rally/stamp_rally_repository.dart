import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repository/stamp_rally/entity/spot.dart';
import '../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../../domain/repository/stamp_rally/stamp_rally_repository.dart';
import '../firebase.dart';
import 'document/spot_document.dart';
import 'document/stamp_rally_document.dart';
import 'spot_repository.dart';

/// 公開中コレクション名プロバイダー
final publicStampRallyCollectionNameProvider =
    Provider((_) => 'publicStampRally');

/// 参加中コレクション名プロバイダー
final entryStampRallyCollectionNameProvider =
    Provider((_) => 'entryStampRally');

/// 公開中スタンプラリーコレクションReferenceのプロバイダ
final publicStampRallyCollectionRefProvider =
    Provider<CollectionReference<Map<String, dynamic>>>(
  (ref) => ref
      .watch(firebaseFirestoreProvider)
      .collection(ref.watch(publicStampRallyCollectionNameProvider)),
);

/// 公開中スタンプラリーStreamProvider
final StreamProvider<List<StampRally>> publicStampRallyStreamProvider =
    StreamProvider<List<StampRally>>((ref) {
  return ref
      .watch(publicStampRallyCollectionRefProvider)
      .snapshots()
      .map((snapshot) {
    final list = snapshot.docs.map((doc) {
      final stampRallyDoc = StampRallyDocument.fromJson(doc.data());

      // スタンプラリードキュメント配下のスポットサブコレクションを取得
      final subCollection = <Spot>[];
      doc.reference
          .collection(ref.watch(spotCollectionNameProvider))
          .get()
          .then((snapshot) {
        snapshot.docs.map((doc) {
          final spotDoc = SpotDocument.fromJson(doc.data());
          subCollection.add(
            Spot(
              id: doc.id,
              order: spotDoc.order,
              imageUrl: spotDoc.imageUrl,
              location: spotDoc.location!,
            ),
          );
        });
      });

      return StampRally(
        id: doc.id,
        title: stampRallyDoc.title,
        explanation: stampRallyDoc.explanation,
        place: stampRallyDoc.place,
        requiredTime: stampRallyDoc.requiredTime,
        imageUrl: stampRallyDoc.imageUrl,
        startDate: stampRallyDoc.startDate,
        endDate: stampRallyDoc.endDate,
        spots: subCollection,
      );
    }).toList();
    return list;
  });
});

/// Firebase スタンプラリーリポジトリ
class FirebaseStampRallyRepository implements StampRallyRepository {
  @override
  StreamProvider<List<StampRally>> fetchAllPublicStampRally() {
    return publicStampRallyStreamProvider;
  }

  @override
  FutureProvider<List<StampRally>> fetchEntryStampRally() {
    // TODO: implement fetchEntryStampRally
    throw UnimplementedError();
  }
}
