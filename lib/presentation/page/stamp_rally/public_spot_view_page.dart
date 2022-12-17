import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/stamp_rally/state/current_public_spot.dart';
import '../../component/async_value_handler.dart';
import '../../component/cached_manager.dart';
import '../../component/delimiter_block.dart';

/// スポット詳細画面
class PublicSpotViewPage extends StatelessWidget {
  const PublicSpotViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('スポット詳細'),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueHandler(
      value: ref.watch(currentPublicSpotProvider),
      builder: (spot) {
        final address = spot.address;
        final tel = spot.tel;
        return Column(
          children: [
            CachedNetworkImage(
              imageUrl: spot.imageUrl,
              cacheManager: ref.read(defaultCacheManager),
            ),
            Text(spot.title),
            if (address != null) Text(address),
            if (tel != null) Text(tel),
            DelimiterBlock(text: spot.summary),
          ],
        );
      },
    );
  }
}
