import 'package:stamp_rally/domain/repository/app_info/app_info_repository.dart';
import 'package:stamp_rally/domain/repository/app_info/entity/app_info.dart';

class MockPackageInfoAppInfoRepository implements AppInfoRepository {
  @override
  Future<AppInfo> getAppInfo() async {
    return const AppInfo(
        appName: 'dummyName',
        packageName: 'dummy',
        version: 'dummy',
        buildNumber: 'dummy',
        copyRight: 'dummy',
        iconImagePath: 'dummy');
  }
}
