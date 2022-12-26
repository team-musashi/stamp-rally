import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stamp_rally/domain/repository/stamp_rally/stamp_rally_repository.dart';

import '../../../infrastructure/mock/mock_stamp_rally_repository.dart';

void main() {
  late ProviderContainer container;

  /// 毎回テストケースを実行するたびに最初に呼ばれる処理
  setUp(() {
    container = ProviderContainer(
      overrides: [
        // テスト用のスタンプラリーリポジトリで上書き
        // 公開中スタンプラリー３件と仮定して
        stampRallyRepositoryProvider
            .overrideWithValue(MockStampRallyRepository())
      ],
    );
  });

  group('stampRallyRepositoryProviderのテスト', () {
    test('DIする前は未実装エラーが発生するはず', () {
      expect(
        () => ProviderContainer().read(stampRallyRepositoryProvider),
        throwsUnimplementedError,
      );
    });
    test('公開中スタンプラリーは3つであるはず', () async {
      container
          .read(stampRallyRepositoryProvider)
          .publicStampRalliesChanges()
          .listen((items) {
        expect(items.length, 3);
      });
    });
  });
}
