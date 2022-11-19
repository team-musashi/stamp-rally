import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'entity/app_info.dart';

/// アプリ情報プロバイダー
final appInfoProvider = FutureProvider(
  (ref) => ref.watch(appInfoRepositoryProvider).getAppInfo(),
);

/// アプリ情報リポジトリプロバイダー
final appInfoRepositoryProvider = Provider<AppInfoRepository>(
  (ref) => throw UnimplementedError('Provider was not initialized'),
);

/// アプリ情報リポジトリ
abstract class AppInfoRepository {
  /// アプリ情報を返す
  Future<AppInfo> getAppInfo();
}
