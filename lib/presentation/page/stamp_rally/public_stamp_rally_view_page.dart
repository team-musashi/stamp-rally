import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/stamp_rally/state/current_public_stamp_rally.dart';
import '../../../application/stamp_rally/state/enter_stamp_rally_result.dart';
import '../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../component/app_bar_title.dart';
import '../../component/async_value_handler.dart';
import '../../component/widget_ref.dart';
import '../../router.dart';
import 'component/stamp_rally_display_mode.dart';
import 'component/stamp_rally_list_view.dart';
import 'component/stamp_rally_map_view.dart';

/// 公開スタンプラリー詳細画面
class PublicStampRallyViewPage extends StatelessWidget {
  const PublicStampRallyViewPage({super.key});

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
    // スタンプラリー参加の結果を監視する
    ref.listenResult<StampRally?>(
      enterStampRallyResultProvider,
      completeMessage: 'スタンプラリーに参加しました！',
      complete: (stampRally) {
        if (stampRally != null) {
          const HomeRoute().go(context);
        }
      },
    );

    return AsyncValueHandler(
      value: ref.watch(currentPublicStampRallyProvider),
      builder: (stampRally) {
        if (stampRally.spots.isEmpty) {
          // スポットが0件の場合はマップで表示するものがないのでリスト表示のみ
          return StampRallyListView(
            stampRally: stampRally,
          );
        }

        return StampRallyViewBuilder(
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
    );
  }
}
