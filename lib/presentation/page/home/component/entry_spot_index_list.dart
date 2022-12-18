import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/geolocator/geolocator_service.dart';
import '../../../../application/stamp_rally/state/current_entry_stamp_rally.dart';
import '../../../../domain/repository/stamp_rally/entity/spot.dart';
import '../../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../../component/async_value_handler.dart';

/// 参加スポット一覧リスト
class EntrySpotIndexList extends ConsumerWidget {
  const EntrySpotIndexList({required this.onIndexChanged, super.key});
  final Future<void> Function(Spot) onIndexChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueHandler<StampRally>(
      value: ref.watch(currentEntryStampRallyProvider),
      builder: (StampRally? stampRally) {
        if (stampRally == null) {
          return Container();
        }
        final cardSizeHeight = MediaQuery.of(context).size.height * 0.3;
        return SizedBox(
          height: cardSizeHeight + 8,
          child: Swiper(
            itemBuilder: (context, index) {
              final spot = stampRally.spots[index];
              final distance =
                  ref.read(geolocatorServiceProvider).distanceBetween(
                        latitude: spot.location.latitude,
                        longitude: spot.location.longitude,
                      );
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: cardSizeHeight * 0.7,
                      child: Stack(
                        children: [
                          // DecoratedBoxだとDecorationImageがうまく効かないので、
                          // 一旦Containerで対処
                          // ignore: use_decorated_box
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(
                                  spot.imageUrl,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            margin: const EdgeInsets.only(left: 6, bottom: 2),
                            child: Text(
                              spot.title,
                              style: TextStyle(
                                fontSize: 28,
                                color: Theme.of(context).colorScheme.background,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: cardSizeHeight * 0.3,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 6, left: 10),
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.tag_fill,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                ),
                                Expanded(
                                  child: Text(
                                    spot.address ?? '',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4, left: 10),
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.placemark_fill,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                ),
                                Text(
                                  '現在地からの距離：${distance ?? ''} km',
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            loop: false,
            itemCount: stampRally.spots.length,
            viewportFraction: 0.8,
            onIndexChanged: (value) async =>
                onIndexChanged.call(stampRally.spots[value]),
          ),
        );
      },
    );
  }
}
