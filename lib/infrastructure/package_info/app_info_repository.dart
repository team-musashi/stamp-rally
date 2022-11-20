import 'dart:async';

import 'package:package_info_plus/package_info_plus.dart';

import '../../domain/repository/app_info/app_info_repository.dart';
import '../../domain/repository/app_info/entity/app_info.dart';

/// PackageInfoアプリ情報リポジトリ
class PackageInfoAppInfoRepository implements AppInfoRepository {
  const PackageInfoAppInfoRepository({
    required this.copyRight,
    required this.iconImagePath,
  });

  /// CopyRight
  final String copyRight;

  /// アイコン画像へのパス
  final String iconImagePath;

  @override
  Future<AppInfo> getAppInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return AppInfo(
      appName: packageInfo.appName,
      packageName: packageInfo.packageName,
      version: 'v${packageInfo.version}',
      buildNumber: packageInfo.buildNumber,
      copyRight: copyRight,
      iconImagePath: iconImagePath,
    );
  }
}
