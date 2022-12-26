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

  group('publicStampRalliesProviderのテスト', () {
    test('公開中スタンプラリーとして３件返ってくるはず', () async {
      // 初回はローディング
      expect(container.read(publicStampRalliesProvider) is AsyncLoading, true);

      /// 非同期処理が終わるのを待つ
      await container.read(publicStampRalliesProvider.future);

      // 非同期処理の結果を取得してその中身をテスト
      final values = container.read(publicStampRalliesProvider).value;
      expect(values, isNotNull);
      expect(values!.length, 3);
      expect(values.last.id, 'c');
    });
  });
}
