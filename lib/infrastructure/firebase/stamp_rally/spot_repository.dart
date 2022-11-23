import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/repository/stamp_rally/entity/spot.dart';
import '../../../domain/repository/stamp_rally/spot_repository.dart';
import 'document/spot_document.dart';

/// Firebase スポットリポジトリ
class FirebaseSpotRepository implements SpotRepository {
  FirebaseSpotRepository({
    required this.store,
  });
  final FirebaseFirestore store;

  @override

  /// StampRally.idに紐づくスポットを取得する
  Future<List<Spot>> fetchSpots({required String stampRallyId}) async {
    final snapshot = await store
        .collection('publicStampRally')
        .doc(stampRallyId)
        .collection('spot')
        .get();
    final spots = snapshot.docs.map((doc) {
      final spotDoc = SpotDocument.fromJson(doc.data());
      return Spot(
        id: doc.id,
        imageUrl: spotDoc.imageUrl,
        location: spotDoc.location!,
        order: spotDoc.order,
        gotDate: spotDoc.gotDate,
      );
    }).toList();

    return spots;
  }
}
