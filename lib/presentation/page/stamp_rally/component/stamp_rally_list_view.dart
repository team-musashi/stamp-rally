import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/repository/stamp_rally/entity/spot.dart';
import '../../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../../component/cached_manager.dart';
import '../../../router.dart';
import 'spot_thumbnail.dart';
import 'stamp_rally_button.dart';
import 'stamp_rally_section.dart';

/// 横方向のパディング
const _horizontalPadding = 16.0;

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

    return Stack(
      children: [
        // スタンプラリー画像
        CachedNetworkImage(
          imageUrl: widget.stampRally.imageUrl,
          cacheManager: ref.watch(defaultCacheManagerProvider),
        ),

        // スタンプラリーの説明
        _StampRallyExplanation(
          stampRally: widget.stampRally,
          topMargin: 240,
        ),
      ],
    );
  }
}

/// スタンプラリーの説明
class _StampRallyExplanation extends StatelessWidget {
  const _StampRallyExplanation({
    required this.stampRally,
    required this.topMargin,
  });

  final StampRally stampRally;
  final double topMargin;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(16),
          ),
          margin: EdgeInsets.only(top: topMargin),
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: _horizontalPadding,
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: StampRallyButton.buttonSize + 8,
                          bottom: 4,
                        ),
                        child: Text(
                          stampRally.title,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: 18,
                                  ),
                        ),
                      ),
                      const Divider(
                        thickness: 1.5,
                      ),
                      _StampedCountText(
                        stampRally: stampRally,
                      ),
                      StampRallySection(
                        icon: Icons.location_on,
                        title: 'エリア',
                        body: stampRally.area,
                      ),
                      StampRallySection(
                        icon: Icons.schedule,
                        title: '所要時間',
                        body: '${stampRally.requiredTime.toString()} 時間',
                      ),
                      StampRallySection(
                        icon: Icons.summarize,
                        title: '概要',
                        body: stampRally.summary,
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 4 / 3,
                        ),
                        itemCount: stampRally.spots.length,
                        itemBuilder: (context, index) {
                          final spot = stampRally.spots[index];
                          return _SpotThumbnail(
                            spot: spot,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // 参加／完了／中断ボタン
        Container(
          alignment: Alignment.topRight,
          margin: EdgeInsets.only(
            top: topMargin - StampRallyButton.buttonSize / 2,
            right: 20,
          ),
          child: StampRallyControlButton(
            stampRally: stampRally,
          ),
        ),
      ],
    );
  }
}

/// スタンプ数
///
/// 参加スタンプラリーのみ表示する
class _StampedCountText extends StatelessWidget {
  const _StampedCountText({
    required this.stampRally,
  });

  final StampRally stampRally;

  @override
  Widget build(BuildContext context) {
    if (!stampRally.isEntry) {
      return const SizedBox();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: DefaultTextStyle.merge(
        style: Theme.of(context).textTheme.headline3?.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${stampRally.stampedCount}',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
            const Text(' / '),
            Text('${stampRally.spots.length}'),
          ],
        ),
      ),
    );
  }
}

/// スポット画像
class _SpotThumbnail extends ConsumerWidget {
  const _SpotThumbnail({
    required this.spot,
  });

  final Spot spot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (spot.isEntry) {
      return InkWell(
        onTap: () async {
          EntrySpotViewRoute.fromSpot(spot).go(context);
        },
        child: EntrySpotThumbnail(
          spot: spot,
        ),
      );
    }

    return InkWell(
      onTap: () async {
        PublicSpotViewRoute.fromSpot(spot).go(context);
      },
      child: PublicSpotThumbnail(
        spot: spot,
      ),
    );
  }
}
