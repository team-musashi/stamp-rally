import 'dart:io';

import 'package:collection/collection.dart';

/// アプリのプラットフォーム
enum AppPlatform {
  android,
  iOS,
  ;

  /// 文字列から AppPlatform を返す
  /// 見つからない場合は null を返す
  static AppPlatform? nameOf(String? name) =>
      AppPlatform.values.firstWhereOrNull((platform) => platform.name == name);

  /// 現在のプラットフォームを返す
  static AppPlatform get currentPlatform {
    if (Platform.isAndroid) {
      return AppPlatform.android;
    }
    if (Platform.isIOS) {
      return AppPlatform.iOS;
    }
    throw ArgumentError('Unknown platform');
  }

  /// すべてのプラットフォームを意味する
  static const any = 'any';
}
