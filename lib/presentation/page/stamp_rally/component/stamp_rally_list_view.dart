import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/stamp_rally/stamp_rally_service.dart';
import '../../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../../component/cached_manager.dart';
import '../../../component/dialog.dart';
import '../../../component/thumbnail.dart';
import '../../../router.dart';

/// スタンプラリー詳細のリスト表示
class StampRallyListView extends ConsumerStatefulWidget {
  const StampRallyListView({
    super.key,
    required this.stampRally,
  });

  final StampRally stampRally;

  @override
  ConsumerState<StampRallyListView> createState() => _StampRallyListViewState();
}

class _StampRallyListViewState extends ConsumerState<StampRallyListView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    // Todo Figmaにあわせてデザイン実装
    final stampRally = widget.stampRally;
    return SingleChildScrollView(
      child: Column(
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
      ),
    );
  }
}
