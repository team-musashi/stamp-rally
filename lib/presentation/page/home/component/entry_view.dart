import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/stamp_rally/stamp_rally_service.dart';
import '../../../../application/stamp_rally/state/complete_stamp_rally_result.dart';
import '../../../../application/stamp_rally/state/current_entry_stamp_rally.dart';
import '../../../../application/stamp_rally/state/withdraw_stamp_rally_result.dart';
import '../../../component/async_value_handler.dart';
import '../../../component/dialog.dart';
import '../../../component/widget_ref.dart';
import '../../../router.dart';
import 'stamp_rally.dart';

/// 参加中画面
class EntryView extends ConsumerWidget {
  const EntryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // スタンプラリー中断の結果を監視する
    ref.listenResult<void>(
      withdrawStampRallyResultProvider,
      completeMessage: 'スタンプラリーを中断しました。',
      complete: (_) {
        const HomeRoute().go(context);
      },
    );

    // スタンプラリー完了の結果を監視する
    ref.listenResult<void>(
      completeStampRallyResultProvider,
      completeMessage: 'スタンプラリーを完了にしました。',
      complete: (_) {
        const HomeRoute().go(context);
      },
    );

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
              onPressed: () => showDialog<void>(
                context: context,
                builder: (context) => ConfirmDialog(
                  content: '参加を完了しますか？',
                  onApproved: () async {
                    Navigator.of(context).pop();
                    await ref
                        .read(stampRallyServiceProvider)
                        .completeStampRally(stampRallyId: stampRally.id);
                  },
                ),
              ),
              child: const Text('参加完了'),
            ),
            ElevatedButton(
              onPressed: () => showDialog<void>(
                context: context,
                builder: (context) => ConfirmDialog(
                  content: '本当に参加を中断しますか？',
                  onApproved: () async {
                    Navigator.of(context).pop();
                    await ref
                        .read(stampRallyServiceProvider)
                        .withdrawStampRally(stampRallyId: stampRally.id);
                  },
                ),
              ),
              child: const Text('参加中断'),
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
