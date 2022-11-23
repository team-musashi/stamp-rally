import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'config/firebase_options_dev.dart' as dev;
import 'config/firebase_options_prod.dart' as prod;
import 'domain/entity/app_info.dart';
import 'domain/repository/stamp_rally/spot_repository.dart';
import 'domain/repository/stamp_rally/stamp_rally_repository.dart';
import 'domain/repository/user/user_repository.dart';
import 'infrastructure/firebase/firebase.dart';
import 'infrastructure/firebase/stamp_rally/spot_repository.dart';
import 'infrastructure/firebase/stamp_rally/stamp_rally_repository.dart';
import 'infrastructure/firebase/user/user_repository.dart';
import 'presentation/app.dart';
import 'util/assets/assets.gen.dart';
import 'util/constants.dart';
import 'util/provider_logger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase の初期化
  await Firebase.initializeApp(
    options: isProd
        ? prod.DefaultFirebaseOptions.currentPlatform
        : dev.DefaultFirebaseOptions.currentPlatform,
  );

  // 画面の向きを固定
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // 縦固定
  ]);

  // パッケージ情報
  final packageInfo = await PackageInfo.fromPlatform();

  runApp(
    ProviderScope(
      observers: [
        ProviderLogger(),
      ],
      overrides: [
        // アプリ情報の上書き
        appInfoProvider.overrideWith(
          (ref) => AppInfo(
            appName: packageInfo.appName,
            packageName: packageInfo.packageName,
            version: 'v${packageInfo.version}',
            buildNumber: packageInfo.buildNumber,
            copyRight: '(C)2022 team-musashi',
            iconImagePath: isProd
                ? Assets.images.iconProd.path
                : Assets.images.iconDev.path,
            privacyPolicyUrl: Uri.parse(
              'https://team-musashi.github.io/stamp-rally-doc/privacy-policy.html',
            ),
            termsOfServiceUrl: Uri.parse(
              'https://team-musashi.github.io/stamp-rally-doc/terms-of-service.html',
            ),
          ),
        ),

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
        stampRallyRepositoryProvider.overrideWith(
          (ref) {
            final repository = FirebaseStampRallyRepository(
              store: ref.watch(firebaseFirestoreProvider),
            );
            ref.onDispose(repository.dispose);
            return repository;
          },
        ),
        spotRepositoryProvider.overrideWith(
          (ref) {
            final repository = FirebaseSpotRepository(
              store: ref.watch(firebaseFirestoreProvider),
            );
            return repository;
          },
        ),
      ],
      child: const App(),
    ),
  );
}
