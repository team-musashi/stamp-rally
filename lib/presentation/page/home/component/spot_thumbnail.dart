import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../component/cached_manager.dart';

/// スポットのサムネイル画像
class SpotThumbnail extends ConsumerWidget {
  const SpotThumbnail({
    super.key,
    required this.spotImageUrl,
    this.padding = const EdgeInsets.all(8),
    this.cacheManager,
    required this.index,
    this.title,
  });

  final String spotImageUrl;
  final EdgeInsets padding;
  final CacheManager? cacheManager;
  final String index;
  final String? title;

  static const radius = 16.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: padding,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: CachedNetworkImage(
            imageUrl: spotImageUrl,
            cacheManager:
                cacheManager ?? ref.watch(defaultCacheManagerProvider),
            imageBuilder: (context, imageProvider) {
              return Stack(
                fit: StackFit.passthrough,
                children: [
                  Image(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                  if (title != null) _Cover(title: title!),
                  _SpotIndex(
                    index: index,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _SpotIndex extends StatelessWidget {
  const _SpotIndex({
    required this.index,
  });

  final String index;
  static const radius = 16.0;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        width: 34,
        height: 34,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(radius),
            bottomLeft: Radius.circular(radius),
          ),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Text(
          index,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      ),
    );
  }
}

class _Cover extends StatelessWidget {
  const _Cover({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        width: double.infinity,
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 4),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.surface,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
