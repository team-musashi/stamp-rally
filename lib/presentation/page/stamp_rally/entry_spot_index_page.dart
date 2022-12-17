import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/stamp_rally/state/current_entry_stamp_rally.dart';
import '../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../component/async_value_handler.dart';
import '../../component/cached_manager.dart';

/// 参加スポット一覧画面
class EntrySpotIndexPage extends StatelessWidget {
  const EntrySpotIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('スポット一覧'),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueHandler<StampRally>(
      value: ref.watch(currentEntryStampRallyProvider),
      builder: (stampRally) {
        return ListView.builder(
          itemCount: stampRally.spots.length,
          itemBuilder: (context, index) {
            final spot = stampRally.spots[index];
            return CachedNetworkImage(
              imageUrl: spot.imageUrl,
              cacheManager: ref.read(defaultCacheManager),
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
            );
          },
        );
      },
    );
  }
}
