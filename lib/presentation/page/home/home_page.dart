import 'package:flutter/material.dart';

import '../../../util/assets/assets.gen.dart';
import '../../component/stamp_rally_view.dart';
import '../../router.dart';

/// ホーム画面
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
          bottom: TabBar(
            tabs: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  '公開中',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  '参加中',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  '完了済',
                ),
              )
            ],
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(30), // Creates border
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 8),
            labelColor: Theme.of(context).colorScheme.background,
            unselectedLabelColor: Colors.black,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => const SettingRoute().push(context),
              icon: const Icon(Icons.settings),
            )
          ],
        ),
        body: const TabBarView(
          children: [
            SingleChildScrollView(
              child: StampRallyListView(),
            ),
            Center(child: Text('参加中')), // Todo: 参加中ListView
            Center(child: Text('完了済')) // Todo: 完了済ListView
          ],
        ),
      ),
    );
  }
}
