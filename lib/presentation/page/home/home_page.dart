import 'package:flutter/material.dart';

import '../../../util/assets/assets.gen.dart';
import '../../router.dart';
import 'component/home_tab.dart';

/// ホーム画面
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: HomeTab.values.length,
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              // Todo: アイコンが確定次第差し替える
              Assets.images.iconStamp.image(
                height: 12,
                color: Theme.of(context).colorScheme.primary,
              ),
              Assets.images.logoStampRarry.image(
                height: 32,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
          bottom: TabBar(
            tabs: HomeTab.values
                .map(
                  (tab) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(tab.title),
                  ),
                )
                .toList(),
            padding: const EdgeInsets.only(bottom: 8),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(30), // Creates border
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 8),
            labelColor: Theme.of(context).colorScheme.surface,
            unselectedLabelColor: Theme.of(context).colorScheme.onSurface,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => const SettingRoute().push(context),
              icon: const Icon(Icons.settings),
            )
          ],
        ),
        body: TabBarView(
          children: HomeTab.values.map((tab) => tab.view).toList(),
        ),
      ),
    );
  }
}
