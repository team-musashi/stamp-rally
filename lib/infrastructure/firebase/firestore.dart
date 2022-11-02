import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth.dart';

/// FirebaseFirestoreプロバイダー
final firebaseFirestoreProvider = Provider(
  (ref) => FirebaseFirestore.instance,
);

/// ユーザードキュメント参照プロバイダー
final userDocRefProvider = Provider<DocumentReference<Map<String, dynamic>>?>(
  (ref) {
    final uid = ref.watch(firebaseUserIdProvider).value;
    if (uid == null) {
      return null;
    }
    return ref.watch(firebaseFirestoreProvider).collection('user').doc(uid);
  },
);
