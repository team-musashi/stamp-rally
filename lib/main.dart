import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'domain/repository/auth/auth_repository.dart';
import 'domain/repository/user/user_repository.dart';
import 'infrastructure/firebase_auth/auth.dart';
import 'infrastructure/firebase_auth/auth/auth_repository.dart';
import 'infrastructure/firebase_core/core.dart';
import 'infrastructure/firebase_firestore/firestore.dart';
import 'infrastructure/firebase_firestore/user/user_repository.dart';
import 'presentation/app.dart';
import 'util/logger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase の初期化
  await initializeFirebaseApp();

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
