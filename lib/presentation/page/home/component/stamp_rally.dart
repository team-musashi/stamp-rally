import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../../component/cached_manager.dart';

/// スタンプラリーのサムネイル画像
class StampRallyThumbnail extends ConsumerWidget {
  const StampRallyThumbnail({
    super.key,
    required this.stampRally,
    this.padding = const EdgeInsets.all(8),
    this.cacheManager,
    this.title,
  });

  final StampRally stampRally;
  final EdgeInsets padding;
  final CacheManager? cacheManager;
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
            imageUrl: stampRally.imageUrl,
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
                ],
              );
            },
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
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
        ),
      ),
    );
  }
}
