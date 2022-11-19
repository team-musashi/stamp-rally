import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// パッケージ情報プロバイダー
final packageInfoProvider = FutureProvider.autoDispose<PackageInfo>(
  (ref) => ref.watch(packageInfoServiceProvider).getPackageInfo(),
);

/// パッケージ情報サービスプロバイダー
final packageInfoServiceProvider = Provider(PackageInfoService.new);

class PackageInfoService {
  const PackageInfoService(this.ref);

  final Ref ref;

  /// パッケージ情報を取得する
  Future<PackageInfo> getPackageInfo() {
    return PackageInfo.fromPlatform();
  }
}
