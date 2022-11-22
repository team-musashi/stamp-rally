import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stamp_rally/domain/repository/app_info/app_info_repository.dart';
import 'package:stamp_rally/domain/repository/stamp_rally/stamp_rally_repository.dart';
import 'package:stamp_rally/domain/repository/user/user_repository.dart';
import 'package:stamp_rally/presentation/app.dart';

import '../infrastructure/mock/mock_package_info_appInfo_repository.dart';
import '../infrastructure/mock/mock_stamp_rally_repository.dart';
import '../infrastructure/mock/mock_user_repository.dart';

void main() {
  late ProviderContainer container;

  /// 毎回テストケースを実行するたびに最初に呼ばれる処理
  setUp(() {
    container = ProviderContainer(
      overrides: [
        // テスト用のスタンプラリーリポジトリで上書き
        stampRallyRepositoryProvider
            .overrideWithValue(MockStampRallyRepository()),
        appInfoRepositoryProvider
            .overrideWithValue(MockPackageInfoAppInfoRepository()),
        userRepositoryProvider.overrideWithValue(MockUserRepository()),
      ],
    );
  });
  testWidgets('StampRallyItemウィジェットの表示数は3である', (WidgetTester tester) async {
    // ホームページ（スタンプラリー一覧）のテスト
    await tester.pumpWidget(const ProviderScope(child: App()));
  });
}
