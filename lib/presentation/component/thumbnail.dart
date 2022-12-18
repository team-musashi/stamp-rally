import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cached_manager.dart';

/// サムネイル画像
class ThumbnailImage extends ConsumerWidget {
  const ThumbnailImage({
    super.key,
    required this.imageUrl,
    this.padding = const EdgeInsets.all(8),
    this.cacheManager,
    this.title,
    this.titleStyle,
    this.cover,
  });

  final String imageUrl;
  final EdgeInsets padding;
  final CacheManager? cacheManager;
  final String? title;
  final TextStyle? titleStyle;
  final Widget? cover;

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
            imageUrl: imageUrl,
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
                  if (title != null)
                    ThumbnailCoverText(
                      title: title!,
                      style: titleStyle,
                    ),
                  if (cover != null) cover!,
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

/// サムネイル画像の上に表示するカバーテキスト
class ThumbnailCoverText extends StatelessWidget {
  const ThumbnailCoverText({
    super.key,
    required this.title,
    this.style,
    this.contentPadding,
  });

  final String title;
  final TextStyle? style;
  final EdgeInsets? contentPadding;

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = TextStyle(
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.surface,
    ).merge(style);
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        width: double.infinity,
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
        child: Padding(
          padding: contentPadding ??
              const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Text(
            title,
            style: effectiveStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
