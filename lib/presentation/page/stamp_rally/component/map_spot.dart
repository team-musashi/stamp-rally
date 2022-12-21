import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../application/geolocator/geolocator_service.dart';
import '../../../../domain/repository/stamp_rally/entity/spot.dart';

/// マップ表示の現在選択中のスポットのインデックス
final currentMapSpotIndexProvider = StateProvider(
  (_) => 0,
);

/// マップで使うスポットのカードを含むSwiper
class MapSpotSwiper extends ConsumerWidget {
  const MapSpotSwiper({
    super.key,
    required this.spots,
  });

  final List<Spot> spots;

  static const height = 240.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: height,
      child: Swiper(
        itemBuilder: (context, index) {
          final spot = spots[index];
          final distance = ref.read(geolocatorServiceProvider).distanceBetween(
                latitude: spot.location.latitude,
                longitude: spot.location.longitude,
              );
          return MapSpotCard(
            spot: spot,
            distance: distance,
          );
        },
        loop: false,
        itemCount: spots.length,
        viewportFraction: 0.8,
        onIndexChanged: (index) {
          ref.read(currentMapSpotIndexProvider.notifier).state = index;
        },
      ),
    );
  }
}

/// マップで使うスポットのカード
class MapSpotCard extends ConsumerWidget {
  const MapSpotCard({
    super.key,
    required this.spot,
    required this.distance,
  });

  final Spot spot;
  final double? distance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      elevation: 4,
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    spot.imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 6, bottom: 2),
                child: Text(
                  spot.title,
                  style: TextStyle(
                    fontSize: 28,
                    color: Theme.of(context).colorScheme.background,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          Column(
            children: [
              const Gap(8),
              _ListTile(
                icon: CupertinoIcons.tag_fill,
                text: spot.address ?? '',
              ),
              _ListTile(
                icon: CupertinoIcons.placemark_fill,
                text: '現在地からの距離：${distance ?? ''} km',
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Row(
        children: [
          Icon(
            icon,
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          const Gap(8),
          Text(
            text,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
