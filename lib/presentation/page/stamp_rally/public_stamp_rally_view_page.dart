import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../application/stamp_rally/stamp_rally_service.dart';
import '../../../application/stamp_rally/state/current_public_stamp_rally.dart';
import '../../../application/stamp_rally/state/enter_stamp_rally_result.dart';
import '../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../../util/assets/join_burarry_icons.dart';
import '../../component/app_bar_title.dart';
import '../../component/async_value_handler.dart';
import '../../component/cached_manager.dart';
import '../../component/widget_ref.dart';
import '../../router.dart';
import 'component/spot_thumbnail.dart';

/// 縦方向のパディング
const _verticalPadding = 8.0;

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
            ),

            // JOIN BURARRYボタン
            Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.only(top: 210, right: 20),
              child: SizedBox(
                height: 70,
                width: 80,
                child: ElevatedButton(
                  onPressed: stampRally.canEntry
                      ? () async {
                          await ref
                              .read(stampRallyServiceProvider)
                              .enterStampRally(stampRallyId: stampRally.id);
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Colors.white,
                    foregroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Icon(
                    JoinBurarry.joinBurarry,
                    size: 45,
                  ),
                ),
              ),
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
  });

  final StampRally stampRally;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.only(top: 240),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: _horizontalPadding,
              right: 120,
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
                  _Section(
                    icon: Icons.location_on,
                    title: 'エリア',
                    body: stampRally.area,
                  ),
                  _Section(
                    icon: Icons.schedule,
                    title: '所要時間',
                    body: '${stampRally.requiredTime.toString()} 時間',
                  ),
                  _Section(
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
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({
    required this.icon,
    required this.title,
    required this.body,
  });

  final IconData icon;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Header(
          icon: icon,
          title: title,
        ),
        const Gap(_verticalPadding),
        Text(
          body,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const Gap(_verticalPadding * 2),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        const Gap(8),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.primaryContainer,
                fontWeight: FontWeight.bold,
              ),
        )
      ],
    );
  }
}
