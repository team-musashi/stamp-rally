import 'dart:async';

import 'package:package_info_plus/package_info_plus.dart';

import '../../domain/repository/app_info/app_info_repository.dart';
import '../../domain/repository/app_info/entity/app_info.dart';

/// PackageInfoアプリ情報リポジトリ
class PackageInfoAppInfoRepository implements AppInfoRepository {
  const PackageInfoAppInfoRepository();

  @override
  Future<AppInfo> getAppInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.toAppInfo();
  }
}

extension _PackageInfoEx on PackageInfo {
  /// PackageInfo => AppInfo
  AppInfo toAppInfo() => AppInfo(
        appName: appName,
        packageName: packageName,
        version: 'v$version',
        buildNumber: buildNumber,
      );
}
