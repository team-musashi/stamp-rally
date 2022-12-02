import 'package:flutter/material.dart';

import '../../component/delimiter_block.dart';
import '../../component/stamp_rally_view.dart';
import '../../router.dart';

/// ホーム画面
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
        actions: [
          IconButton(
            onPressed: () => const SettingRoute().push(context),
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            DelimiterBlock(text: '参加中のスタンプラリー'),
            EntryStampRallyListView(),
            DelimiterBlock(text: '開催中のスタンプラリー'),
            PublicStampRallyListView(),
          ],
        ),
      ),
    );
  }
}
