import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/stamp_rally/state/current_public_stamp_rally.dart';
import '../../../application/stamp_rally/state/enter_stamp_rally_result.dart';
import '../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../component/app_bar_title.dart';
import '../../component/async_value_handler.dart';
import '../../component/cached_manager.dart';
import '../../component/widget_ref.dart';
import '../../router.dart';
import 'component/spot_thumbnail.dart';
import 'component/stamp_rally_button.dart';
import 'component/stamp_rally_section.dart';

/// 横方向のパディング
const _horizontalPadding = 16.0;

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
      completeMessage: 'スタンプラリーに参加しました。',
      complete: (stampRally) {
        if (stampRally != null) {
          const HomeRoute().go(context);
        }
      },
    );

    return AsyncValueHandler(
      value: ref.watch(currentPublicStampRallyProvider),
      builder: (stampRally) {
        return Stack(
          children: [
            // スタンプラリー画像
            CachedNetworkImage(
              imageUrl: stampRally.imageUrl,
              cacheManager: ref.watch(defaultCacheManagerProvider),
            ),

            // スタンプラリーの説明
            _StampRallyExplanation(
              stampRally: stampRally,
              topMargin: 240,
            ),
          ],
        );
      },
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: _horizontalPadding,
                  right: StampRallyButton.buttonSize + 28,
                  top: 16,
                  bottom: 4,
                ),
                child: Text(
                  stampRally.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Divider(
                thickness: 1.5,
                indent: _horizontalPadding,
                endIndent: _horizontalPadding,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: _horizontalPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        ),
                        itemCount: stampRally.spots.length,
                        itemBuilder: (context, index) {
                          final spot = stampRally.spots[index];
                          return InkWell(
                            onTap: () async {
                              PublicSpotViewRoute.fromSpot(spot).go(context);
                            },
                            child: SpotThumbnail(
                              spot: spot,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),

        // 参加ボタン
        Container(
          alignment: Alignment.topRight,
          margin: EdgeInsets.only(
            top: topMargin - StampRallyButton.buttonSize / 2,
            right: 20,
          ),
          child: EnterStampRallyButton(
            stampRally: stampRally,
          ),
        ),
      ],
    );
  }
}
