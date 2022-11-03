import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/constants.dart';
import 'firebase_options_dev.dart' as dev;
import 'firebase_options_prod.dart' as prod;

/// Firebase の初期化
Future<void> initializeFirebaseApp() async {
  // Flavor に応じた FirebaseOptions を準備する
  final firebaseOptions = isProd
      ? prod.DefaultFirebaseOptions.currentPlatform
      : dev.DefaultFirebaseOptions.currentPlatform;

  await Firebase.initializeApp(
    options: firebaseOptions,
  );
}

/// FirebaseAuthプロバイダー
final firebaseAuthProvider = Provider(
  (ref) => FirebaseAuth.instance,
);

/// FirebaseFirestoreプロバイダー
final firebaseFirestoreProvider = Provider(
  (ref) => FirebaseFirestore.instance,
);
