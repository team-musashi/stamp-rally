import 'package:flutter/material.dart';

import '../../../../domain/repository/stamp_rally/entity/spot.dart';
import '../../../component/thumbnail.dart';

/// スポットのサムネイル画像
class SpotThumbnail extends StatelessWidget {
  const SpotThumbnail({
    super.key,
    required this.spot,
  });

  final Spot spot;

  @override
  Widget build(BuildContext context) {
    return ThumbnailImage(
      imageUrl: spot.imageUrl,
      cover: Stack(
        children: [
          ThumbnailCoverText(
            title: spot.title,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 42, vertical: 4),
          ),
          _SpotOrder(
            order: spot.order,
          ),
        ],
      ),
    );
  }
}

class _SpotOrder extends StatelessWidget {
  const _SpotOrder({
    required this.order,
  });

  final int order;

  static const size = 34.0;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(ThumbnailImage.radius),
            bottomLeft: Radius.circular(ThumbnailImage.radius),
          ),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Text(
          order.toString(),
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      ),
    );
  }
}
