import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'application/stamp_rally/state/pin_icon.dart';
import 'domain/entity/app_info.dart';
import 'domain/entity/env.dart';
import 'domain/repository/command/command_repository.dart';
import 'domain/repository/stamp_rally/stamp_rally_repository.dart';
import 'domain/repository/user/user_repository.dart';
import 'firebase_options_dev.dart' as dev;
import 'firebase_options_prod.dart' as prod;
import 'infrastructure/firebase/command/command_repository.dart';
import 'infrastructure/firebase/firebase.dart';
import 'infrastructure/firebase/stamp_rally/stamp_rally_repository.dart';
import 'infrastructure/firebase/user/user_repository.dart';
import 'presentation/app.dart';
import 'util/assets/assets.gen.dart';
import 'util/constants.dart';
import 'util/logger.dart';
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

  // ピンアイコンを生成する
  final pinIcon = await BitmapDescriptor.fromAssetImage(
    const ImageConfiguration(devicePixelRatio: 1),
    Platform.isIOS
        ? 'assets/images/marker_ios.png'
        : 'assets/images/marker_android.png',
  );

  try {
    // 環境変数の読み込み
    await dotenv.load();
    // ignore: avoid_catches_without_on_clauses
  } catch (e) {
    logger.e('.envが見つかりません。.env.defaultをコピーして作成してください。');
    return;
  }

  runApp(
    ProviderScope(
      observers: [
        ProviderLogger(),
      ],
      overrides: [
        // 環境変数を上書き
        envProvider.overrideWith(
          (ref) => Env(
            googleMapAPIKey: dotenv.get('GOOGLE_MAP_API_KEY'),
          ),
        ),

        // アプリ情報の上書き
        appInfoProvider.overrideWith(
          (ref) => AppInfo(
            appName: packageInfo.appName,
            packageName: packageInfo.packageName,
            version: 'v${packageInfo.version}',
            buildNumber: packageInfo.buildNumber,
            copyRight: '(C)2022 team-musashi',
            iconImagePath: Assets.images.icon.path,
            privacyPolicyUrl: Uri.parse(
              'https://team-musashi.github.io/stamp-rally-doc/privacy-policy.html',
            ),
            termsOfServiceUrl: Uri.parse(
              'https://team-musashi.github.io/stamp-rally-doc/terms-of-service.html',
            ),
          ),
        ),

        // ピンアイコン
        pinIconProvider.overrideWithValue(pinIcon),

        // 各 Repository の上書き
        userRepositoryProvider.overrideWith(
          (ref) {
            final repository = FirebaseUserRepository(
              auth: ref.watch(firebaseAuthProvider),
              userColletionRef: ref.watch(userCollectionRefProvider),
            );
            ref.onDispose(repository.dispose);
            return repository;
          },
        ),
        stampRallyRepositoryProvider.overrideWith(
          (ref) {
            final repository = FirebaseStampRallyRepository(
              userDocRef: ref.watch(userDocRefProvider),
              storage: ref.watch(firebaseStorageProvider),
            );
            ref.onDispose(repository.dispose);
            return repository;
          },
        ),
        commandRepositoryProvider.overrideWith((ref) {
          final repository = FirebaseCommandRepository(
            commandCollectionRef: ref.watch(commandCollectionRefProvider),
            uid: ref.watch(firebaseUserIdProvider).value,
          );
          return repository;
        })
      ],
      child: const App(),
    ),
  );
}
