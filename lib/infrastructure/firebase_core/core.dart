import 'package:firebase_core/firebase_core.dart';

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
