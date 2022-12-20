import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/stamp_rally/stamp_rally_service.dart';
import '../../../../application/stamp_rally/state/complete_stamp_rally_result.dart';
import '../../../../application/stamp_rally/state/current_entry_stamp_rally.dart';
import '../../../../application/stamp_rally/state/withdraw_stamp_rally_result.dart';
import '../../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../../component/async_value_handler.dart';
import '../../../component/cached_manager.dart';
import '../../../component/dialog.dart';
import '../../../component/thumbnail.dart';
import '../../../component/widget_ref.dart';
import '../../../router.dart';

/// 参加中スタンプラリーの詳細情報表示用View
class EntryDetailsView extends ConsumerWidget {
  const EntryDetailsView({super.key});

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

    return SingleChildScrollView(
      child: AsyncValueHandler(
        value: ref.watch(currentEntryStampRallyProvider),
        builder: (stampRally) {
          // Todo Figmaにあわせてデザイン実装
          return Column(
            children: [
              ThumbnailImage(
                imageUrl: stampRally.imageUrl,
              ),
              Text(stampRally.title),
              Text('チェックポイント数：${stampRally.spots.length}'),
              ElevatedButton(
                onPressed: () => showDialog<void>(
                  context: context,
                  builder: (context) => ConfirmDialog(
                    message: '参加を完了しますか？',
                    onApproved: () async {
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
                    message: '本当に参加を中断しますか？',
                    onApproved: () async {
                      await ref
                          .read(stampRallyServiceProvider)
                          .withdrawStampRally(stampRallyId: stampRally.id);
                    },
                  ),
                ),
                child: const Text('参加中断'),
              ),
              ...stampRally.spots.map(
                (spot) => InkWell(
                  onTap: () async {
                    EntrySpotViewRoute.fromSpot(spot).go(context);
                  },
                  child: CachedNetworkImage(
                    imageUrl: spot.imageUrl,
                    cacheManager: ref.watch(defaultCacheManagerProvider),
                  ),
                ),
              ),
            ],
          );
        },
        orNull: () => const _EmptyView(),
      ),
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
