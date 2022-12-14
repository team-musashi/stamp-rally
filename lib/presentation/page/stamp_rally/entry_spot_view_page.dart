import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/stamp_rally/state/current_entry_spot.dart';
import '../../component/async_value_handler.dart';
import '../../component/delimiter_block.dart';

/// スポット詳細画面
class EntrySpotViewPage extends StatelessWidget {
  const EntrySpotViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('スポット詳細'),
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
        final address = spot.address;
        final tel = spot.tel;
        return Column(
          children: [
            Image(
              image: NetworkImage(spot.imageUrl),
            ),
            Text(spot.title),
            if (address != null) Text(address),
            if (tel != null) Text(tel),
            DelimiterBlock(text: spot.summary),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('カメラを開く'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('ギャラリーを開く'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
