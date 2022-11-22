import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stamp_rally/domain/repository/stamp_rally/stamp_rally_repository.dart';

import '../../mock/mock_stamp_rally_repository.dart';

void main() {
  late ProviderContainer container;

  /// 毎回テストケースを実行するたびに最初に呼ばれる処理
  setUp(() {
    container = ProviderContainer(
      overrides: [
        // テスト用のスタンプラリーリポジトリで上書き
        stampRallyRepositoryProvider
            .overrideWithValue(MockStampRallyRepository())
      ],
    );
  });

  group('stampRallyRepositoryProvider', () {
    test('DIする前は未実装エラーが発生するはず', () {
      expect(
        () => ProviderContainer().read(stampRallyRepositoryProvider),
        throwsUnimplementedError,
      );
    });
    test('公開中スタンプラリーは3つであるはず', () async {
      container
          .read(stampRallyRepositoryProvider)
          .changesPublicStampRallies()
          .listen((items) {
        expect(items.length, 3);
      });
    });
    test('公開中スタンプラリーの3つ目のタイトルは「３個目の要素」であるはず', () async {
      container
          .read(stampRallyRepositoryProvider)
          .changesPublicStampRallies()
          .listen((items) {
        expect(items[2].title, '３個目のタイトル');
      });
    });
  });
}
