import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../firebase.dart';

/// スポットコレクション名プロバイダー
final spotCollectionNameProvider = Provider((_) => 'spot');

/// スポットコレクションReferenceのプロバイダ
final spotCollectionRefProvider =
    Provider<CollectionReference<Map<String, dynamic>>>(
  (ref) => ref
      .watch(firebaseFirestoreProvider)
      .collection(ref.watch(spotCollectionNameProvider)),
);
