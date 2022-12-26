import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stamp_rally/domain/repository/stamp_rally/stamp_rally_repository.dart';
import 'package:stamp_rally/presentation/page/home/component/entry_view.dart';
import 'package:stamp_rally/presentation/page/stamp_rally/component/stamp_rally_display_mode.dart';
import 'package:stamp_rally/presentation/page/stamp_rally/component/stamp_rally_list_view.dart';
import 'package:stamp_rally/presentation/page/stamp_rally/component/stamp_rally_map_view.dart';

import '../test_agent.dart';

void main() {
  final agent = TestAgent();

  group('参加中スタンプラリーがない場合のテスト', () {
    testWidgets(
      '画面上にNO ACTIVEテキストが表示されるはず',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              entryStampRallyProvider.overrideWith((_) => null),
            ],
            child: const MaterialApp(home: Scaffold(body: EntryView())),
          ),
        );
        await tester.pump();
        expect(find.text('NO ACTIVE'), findsOneWidget);
      },
    );
  });

  group('参加中スタンプラリーがある場合のテスト', () {
    testWidgets(
      '画面上にNO ACTIVEテキストが表示されないはず',
      (WidgetTester tester) async {
        await tester.pumpWidget(agent.createDefaultProviderScopeForEntryView());
        await tester.pump();
        expect(find.text('NO ACTIVE'), findsNothing);
      },
    );
    testWidgets(
      '詳細タブ/マップタブが表示されるはず',
      (WidgetTester tester) async {
        await tester.pumpWidget(agent.createDefaultProviderScopeForEntryView());
        await tester.pump();
        expect(find.byType(StampRallyViewBuilder), findsOneWidget);
      },
    );
    testWidgets(
      '詳細タブが初期選択されているはず',
      (WidgetTester tester) async {
        await tester.pumpWidget(agent.createDefaultProviderScopeForEntryView());
        await tester.pump();
        // 詳細タブは表示
        expect(find.byType(StampRallyListView), findsOneWidget);
        // マップタブは非表示
        expect(find.byType(StampRallyMapView), findsNothing);
      },
    );
    testWidgets(
      'マップボタンタップ時はマップ表示に切り替わるはず、その後詳細ボタンタップ時は詳細表示に切り替わるはず',
      (WidgetTester tester) async {
        await tester.pumpWidget(agent.createDefaultProviderScopeForEntryView());
        await tester.pump();
        await tester.tap(find.byIcon(Icons.map_outlined));
        // 完全にマップが表示し切るまで待つ
        await tester.pumpAndSettle();
        // 詳細タブは非表示
        expect(find.byType(StampRallyListView), findsNothing);
        // マップタブは表示
        expect(find.byType(StampRallyMapView), findsOneWidget);

        //　次に詳細ボタンをタップ
        await tester.tap(find.byIcon(Icons.list));
        // 完全に詳細が表示し切るまで待つ
        await tester.pumpAndSettle();
        // 詳細タブは表示
        expect(find.byType(StampRallyListView), findsOneWidget);
        // マップタブは非表示
        expect(find.byType(StampRallyMapView), findsNothing);
      },
    );
  });
}
