// ignore_for_file: lines_longer_than_80_chars

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    final size = MediaQuery.of(context).size;

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

            // スタンプラリー詳細
            Container(
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              margin: const EdgeInsets.only(top: 245),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 120, top: 10),
                    child: Text(
                      stampRally.title,
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Divider(
                    color: Colors.grey[350],
                    thickness: 2,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      'エリア',
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primaryContainer,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 7),
                                Text(stampRally.area)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 7),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.schedule,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      '所要時間',
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primaryContainer,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 7),
                                Text('${stampRally.requiredTime.toString()}時間')
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 7),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.summarize,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      '概要',
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primaryContainer,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 7),
                                Text(
                                  stampRally.summary,
                                  style: Theme.of(context).textTheme.bodyText1,
                                )
                              ],
                            ),
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.all(4),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemCount: stampRally.spots.length,
                            itemBuilder: (context, index) {
                              final spot = stampRally.spots[index];
                              return InkWell(
                                onTap: () async {
                                  PublicSpotViewRoute.fromSpot(stampRally, spot)
                                      .go(context);
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
                      borderRadius: BorderRadius.circular(15),
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
