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
