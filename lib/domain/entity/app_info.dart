import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_info.freezed.dart';

/// アプリ情報プロバイダー
final appInfoProvider = Provider<AppInfo>(
  (ref) => throw UnimplementedError('Provider was not initialized'),
);

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

    /// プライバシーポリシーのURL
    required Uri privacyPolicyUrl,

    /// 利用規約のURL
    required Uri termsOfServiceUrl,
  }) = _AppInfo;

  const AppInfo._();
}
