import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/stamp_rally/state/complete_stamp_rally_result.dart';
import '../../../../application/stamp_rally/state/current_entry_stamp_rally.dart';
import '../../../../application/stamp_rally/state/withdraw_stamp_rally_result.dart';
import '../../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../../component/async_value_handler.dart';
import '../../../component/widget_ref.dart';
import '../../../router.dart';
import '../../stamp_rally/component/stamp_rally_list_view.dart';

/// 参加中スタンプラリー詳細のリスト表示
class EntryListView extends ConsumerWidget {
  const EntryListView({super.key});

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
    ref.listenResult<StampRally?>(
      completeStampRallyResultProvider,
      completeMessage: 'スタンプラリーを完了にしました。',
      complete: (stampRally) {
        if (stampRally != null) {
          // 処理完了後、完了済スタンプラリー詳細画面に遷移する
          CompleteStampRallyViewRoute.fromStampRally(stampRally).go(context);
        }
      },
    );

    return AsyncValueHandler(
      value: ref.watch(currentEntryStampRallyProvider),
      builder: (stampRally) {
        return StampRallyListView(
          stampRally: stampRally,
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