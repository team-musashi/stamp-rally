import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stamp_rally/presentation/app.dart';

void main() {
  testWidgets('StampRallyItemウィジェットの表示数は3である', (WidgetTester tester) async {
    // ホームページ（スタンプラリー一覧）のテスト
    await tester.pumpWidget(const ProviderScope(child: App()));
  });
}
