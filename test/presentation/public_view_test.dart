import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stamp_rally/domain/repository/stamp_rally/stamp_rally_repository.dart';
import 'package:stamp_rally/presentation/component/thumbnail.dart';
import 'package:stamp_rally/presentation/page/home/component/public_view.dart';

import '../infrastructure/mock/mock_stamp_rally_repository.dart';

void main() {
  testWidgets('公開中スタンプラリー一覧データ読み込み中の時はサムネイル画像が０件であるはず',
      (WidgetTester tester) async {
    // 公開中スタンプラリー一覧ページを初期化
    await tester.pumpWidget(const ProviderScope(child: PublicView()));
    // まだ読み込み中なのでサムネイル画像は生成されない
    expect(find.byType(ThumbnailImage), findsNothing);
  });

  testWidgets('公開中スタンプラリー一覧データ読み込み完了時はサムネイル画像が３件であるはず',
      (WidgetTester tester) async {
    // 公開中スタンプラリー一覧ページを初期化
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          stampRallyRepositoryProvider
              .overrideWithValue(MockStampRallyRepository())
        ],
        child: const MaterialApp(home: Scaffold(body: PublicView())),
      ),
    );

    // 公開中スタンプラリー一覧読み込み（非同期処理）が完了するまで待つ
    await tester.pump();

    // 読み込み完了後はサムネイル画像が生成される
    expect(find.byType(ThumbnailImage), findsNWidgets(3));
  });
}
