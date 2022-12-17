import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../../../../domain/repository/stamp_rally/entity/stamp_rally.dart';

/// スタンプラリーのサムネイル画像
class StampRallyThumbnail extends StatelessWidget {
  const StampRallyThumbnail({
    super.key,
    required this.stampRally,
    this.padding = const EdgeInsets.all(8),
    this.cacheManager,
  });

  final StampRally stampRally;
  final EdgeInsets padding;
  final CacheManager? cacheManager;

  static const radius = 16.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: CachedNetworkImage(
            imageUrl: stampRally.imageUrl,
            fit: BoxFit.cover,
            cacheManager: cacheManager,
          ),
        ),
      ),
    );
  }
}
