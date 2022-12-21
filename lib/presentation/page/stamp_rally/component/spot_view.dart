import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/url_launcher/url_launcher_service.dart';
import '../../../../domain/repository/stamp_rally/entity/spot.dart';
import '../../../component/cached_manager.dart';

/// 公開中スポット／参加中スポットの詳細
class SpotView extends ConsumerWidget {
  const SpotView({required this.spot, super.key});
  final Spot spot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        // スポット画像
        CachedNetworkImage(
          imageUrl: spot.imageUrl,
          cacheManager: ref.watch(defaultCacheManagerProvider),
        ),

        // スポット詳細
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
                padding: const EdgeInsets.only(left: 20, right: 120, top: 10),
                child: Text(
                  spot.title,
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
                                ),
                              ],
                            ),
                            const SizedBox(height: 7),
                            Text(spot.summary)
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
                                  Icons.location_on,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  '住所',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                SizedBox(
                                  height: 27.5,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      ref
                                          .read(urlLauncherServiceProvider)
                                          .launch(spot.location.googleMapUrl);
                                    },
                                    child: const Text('MAPアプリを開く'),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 7),
                            Text(spot.address ?? '不明')
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
                                  Icons.phone,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  '電話番号',
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
                              spot.tel ?? '不明',
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
