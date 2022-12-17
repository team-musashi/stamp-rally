import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/stamp_rally/state/exists_entry_stamp_rally.dart';
import '../../component/app_bar_title.dart';
import '../../component/async_value_handler.dart';
import '../../router.dart';
import 'component/home_tab.dart';

/// ホーム画面
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueHandler<bool>(
      value: ref.watch(existsEntryStampRallyProvider),
      builder: (existsEntry) {
        return DefaultTabController(
          length: HomeTab.values.length,
          initialIndex:
              existsEntry ? HomeTab.entry.index : HomeTab.public.index,
          child: Scaffold(
            appBar: AppBar(
              title: const AppBarTitle(),
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
                  onPressed: () => const SettingRoute().go(context),
                  icon: const Icon(Icons.settings),
                )
              ],
            ),
            body: TabBarView(
              children: HomeTab.values.map((tab) => tab.view).toList(),
            ),
          ),
        );
      },
      loading: () => const _LoadingScaffold(),
    );
  }
}

/// ローディング中のScaffold
class _LoadingScaffold extends StatelessWidget {
  const _LoadingScaffold();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(),
        centerTitle: true,
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
