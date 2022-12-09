import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// FirebaseAuthプロバイダー
final firebaseAuthProvider = Provider(
  (ref) => FirebaseAuth.instance,
);

/// FirebaseUserプロバイダー
final firebaseUserProvider = StreamProvider<User?>(
  (ref) => ref.watch(firebaseAuthProvider).userChanges(),
);

/// FirebaseUserIdプロバイダー
final firebaseUserIdProvider = Provider(
  (ref) => ref.watch(firebaseUserProvider).whenData((user) => user?.uid),
);

/// FirebaseFirestoreプロバイダー
final firebaseFirestoreProvider = Provider(
  (ref) => FirebaseFirestore.instance,
);

/// ユーザーコレクション参照プロバイダー
final userCollectionRefProvider = Provider(
  (ref) => ref.watch(firebaseFirestoreProvider).collection('user'),
);

/// ユーザードキュメント参照プロバイダー
final userDocRefProvider = Provider(
  (ref) {
    final uid = ref.watch(firebaseUserIdProvider).value;
    if (uid == null) {
      return null;
    }
    return ref.watch(userCollectionRefProvider).doc(uid);
  },
);
