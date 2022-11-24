import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// FirebaseAuthプロバイダー
final firebaseAuthProvider = Provider(
  (ref) => FirebaseAuth.instance,
);

/// FirebaseFirestoreプロバイダー
final firebaseFirestoreProvider = Provider(
  (ref) => FirebaseFirestore.instance,
);
