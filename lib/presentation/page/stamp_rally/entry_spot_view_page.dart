import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/stamp_rally/state/current_entry_spot.dart';
import '../../component/app_bar_title.dart';
import '../../component/async_value_handler.dart';
import 'component/spot_list_view.dart';

/// 参加中スポット詳細画面
class EntrySpotViewPage extends StatelessWidget {
  const EntrySpotViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueHandler(
      value: ref.watch(currentEntrySpotProvider),
      builder: (spot) {
        return SpotListView(spot: spot);
      },
    );
  }
}
