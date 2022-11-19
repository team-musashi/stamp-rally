import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'domain/repository/stamp_rally/stamp_rally_repository.dart';
import 'domain/repository/user/user_repository.dart';
import 'infrastructure/firebase/firebase.dart';
import 'infrastructure/firebase/stamp_rally/stamp_rally_repository.dart';
import 'infrastructure/firebase/user/user_repository.dart';
import 'presentation/app.dart';
import 'util/provider_logger.dart';

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
        userRepositoryProvider.overrideWith(
          (ref) {
            final repository = FirebaseUserRepository(
              auth: ref.watch(firebaseAuthProvider),
              firestore: ref.watch(firebaseFirestoreProvider),
            );
            ref.onDispose(repository.dispose);
            return repository;
          },
        ),
        stampRallyRepositoryProvider
            .overrideWithValue(FirebaseStampRallyRepository())
      ],
      child: const App(),
    ),
  );
}
