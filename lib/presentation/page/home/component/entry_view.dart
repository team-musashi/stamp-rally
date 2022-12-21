import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/stamp_rally/state/complete_stamp_rally_result.dart';
import '../../../../application/stamp_rally/state/current_entry_stamp_rally.dart';
import '../../../../application/stamp_rally/state/withdraw_stamp_rally_result.dart';
import '../../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../../component/async_value_handler.dart';
import '../../../component/widget_ref.dart';
import '../../../router.dart';
import '../../stamp_rally/component/stamp_rally_display_mode.dart';
import '../../stamp_rally/component/stamp_rally_list_view.dart';
import '../../stamp_rally/component/stamp_rally_map_view.dart';

/// 参加中画面
class EntryView extends ConsumerStatefulWidget {
  const EntryView({super.key});

  @override
  ConsumerState<EntryView> createState() => _EntryViewState();
}

class _EntryViewState extends ConsumerState<EntryView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

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
        return StampRallyViewBuilder(
          initialMode: StampRallyDisplayMode.map,
          builder: (mode) {
            switch (mode) {
              case StampRallyDisplayMode.list:
                return StampRallyListView(
                  stampRally: stampRally,
                );
              case StampRallyDisplayMode.map:
                return StampRallyMapView(
                  stampRally: stampRally,
                );
            }
          },
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
