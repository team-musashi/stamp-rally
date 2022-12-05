import 'package:flutter/material.dart';

import '../../../util/assets/assets.gen.dart';
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
        title: Column(
          children: [
            // Todo: アイコンが確定次第差し替える
            Assets.images.iconStamp.image(
                height: 12, color: Theme.of(context).colorScheme.primary),
            Assets.images.logoStampRarry.image(
                height: 32, color: Theme.of(context).colorScheme.primary),
          ],
        ),
        centerTitle: true,
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
            DelimiterBlock(text: '開催中のスタンプラリー'),
            StampRallyListView(),
          ],
        ),
      ),
    );
  }
}
