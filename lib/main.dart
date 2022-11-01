import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'domain/repository/auth/auth_repository.dart';
import 'domain/repository/user/user_repository.dart';
import 'firebase_options_dev.dart' as dev;
import 'firebase_options_prod.dart' as prod;
import 'infrastructure/firebase_auth/auth.dart';
import 'infrastructure/firebase_auth/auth/auth_repository.dart';
import 'infrastructure/firebase_firestore/firestore.dart';
import 'infrastructure/firebase_firestore/user/user_repository.dart';
import 'presentation/app.dart';
import 'util/logger.dart';

const flavor = String.fromEnvironment('FLAVOR');
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Flavor に応じた FirebaseOptions を準備する
  final firebaseOptions = flavor == 'prod'
      ? prod.DefaultFirebaseOptions.currentPlatform
      : dev.DefaultFirebaseOptions.currentPlatform;

  // Firebase の初期化
  await Firebase.initializeApp(
    options: firebaseOptions,
  );

  runApp(
    ProviderScope(
      observers: [
        ProviderLogger(),
      ],
      overrides: [
        // 各 Repository の上書き
        authRepositoryProvider.overrideWith(
          (ref) => FirebaseAuthRepository(
            auth: ref.watch(firebaseAuthProvider),
            firebaseUser: ref.watch(firebaseUserProvider).value,
          ),
        ),
        userRepositoryProvider.overrideWith(
          (ref) {
            final repository = FirebaseUserRepository(
              firebaseUser: ref.watch(firebaseUserProvider).value,
              docRef: ref.watch(userDocRefProvider),
            );
            ref.onDispose(repository.dispose);
            return repository;
          },
        ),
      ],
      child: const App(),
    ),
  );
}
