import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../application/geolocator/state/current_geolocator_position.dart';
import '../../../../domain/repository/stamp_rally/entity/spot.dart';
import '../../../component/async_value_handler.dart';

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
          return MapSpotCard(
            spot: spot,
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
  });

  final Spot spot;

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
              _SpotAddressListTile(spot: spot),
              _SpotDistanceListTile(spot: spot),
            ],
          )
        ],
      ),
    );
  }
}

/// スポットの住所
class _SpotAddressListTile extends StatelessWidget {
  const _SpotAddressListTile({
    required this.spot,
  });

  final Spot spot;

  @override
  Widget build(BuildContext context) {
    return _ListTile(
      icon: CupertinoIcons.tag_fill,
      text: spot.address ?? '',
    );
  }
}

/// 現在地からの距離
class _SpotDistanceListTile extends ConsumerWidget {
  const _SpotDistanceListTile({
    required this.spot,
  });

  final Spot spot;

  static const icon = CupertinoIcons.placemark_fill;
  static const label = '現在地からの距離：';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueHandler(
      value: ref.watch(currentUserLocationProvider),
      builder: (userLocation) {
        final distance = userLocation.distance(spot.location);
        return _ListTile(
          icon: icon,
          text: '$label${distance ?? ''} km',
        );
      },
      loading: () => const _ListTile(
        icon: icon,
        text: '$label測定中...',
      ),
      orNull: () => const _ListTile(
        icon: icon,
        text: '$label-',
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
          Expanded(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
