import 'dart:io';

/// アプリのプラットフォーム
enum AppPlatform {
  android,
  ios,
  ;

  /// 文字列から AppPlatform を返す
  /// 見つからない場合は IterableElementError.noElement() を投げる
  static AppPlatform nameOf(String name) =>
      AppPlatform.values.firstWhere((platform) => platform.name == name);

  /// 現在のプラットフォームを返す
  static AppPlatform get currentPlatform {
    if (Platform.isAndroid) {
      return AppPlatform.android;
    }
    if (Platform.isIOS) {
      return AppPlatform.ios;
    }
    throw ArgumentError('Unknown platform');
  }

  /// すべてのプラットフォームを意味する
  static const any = 'any';
}
