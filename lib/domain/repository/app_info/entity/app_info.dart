import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_info.freezed.dart';

/// アプリ情報
@freezed
class AppInfo with _$AppInfo {
  const factory AppInfo({
    /// アプリ名
    required String appName,

    /// パッケージ名
    required String packageName,

    /// バージョン
    required String version,

    /// ビルド番号
    required String buildNumber,

    /// CopyRight
    required String copyRight,

    /// アイコン画像へのパス
    required String iconImagePath,
  }) = _AppInfo;

  const AppInfo._();
}
