import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/constants.dart';
import 'domain/repository/app_info/app_info_repository.dart';
import 'domain/repository/stamp_rally/stamp_rally_repository.dart';
import 'domain/repository/user/user_repository.dart';
import 'infrastructure/firebase/firebase.dart';
import 'infrastructure/firebase/stamp_rally/stamp_rally_repository.dart';
import 'infrastructure/firebase/user/user_repository.dart';
import 'infrastructure/package_info/app_info_repository.dart';
import 'presentation/app.dart';
import 'util/assets/assets.gen.dart';
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
        appInfoRepositoryProvider.overrideWith(
          (ref) => PackageInfoAppInfoRepository(
            copyRight: '(C)2022 team-musashi',
            iconImagePath: isProd
                ? Assets.images.iconProd.path
                : Assets.images.iconDev.path,
          ),
        ),
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
        stampRallyRepositoryProvider.overrideWith(
          (ref) {
            final repository = FirebaseStampRallyRepository(
              store: ref.watch(firebaseFirestoreProvider),
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
