import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/stamp_rally/state/current_entry_stamp_rally.dart';
import '../../../component/async_value_handler.dart';
import '../../../router.dart';
import 'stamp_rally.dart';

/// 参加中画面
class EntryView extends ConsumerWidget {
  const EntryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueHandler(
      value: ref.watch(currentEntryStampRallyProvider),
      builder: (stampRally) {
        // Todo Figmaにあわせてデザイン実装
        return Column(
          children: [
            InkWell(
              onTap: () {
                EntrySpotIndexRoute.fromStampRally(stampRally).push(context);
              },
              child: StampRallyThumbnail(
                stampRally: stampRally,
              ),
            ),
            Text(stampRally.title),
            Text('チェックポイント数：${stampRally.spots.length}'),
            ElevatedButton(
              onPressed: () {
                // ToDo 参加完了処理
              },
              child: const Text('参加完了'),
            ),
          ],
        );
      },
      orNull: () => const _EmptyView(),
    );
  }
}

/// 参加中のスタンプラリーがない場合の表示
class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('参加中のスタンプラリーはありません'),
    );
  }
}
