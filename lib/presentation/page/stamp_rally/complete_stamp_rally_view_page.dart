import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/stamp_rally/state/current_complete_stamp_rally.dart';
import '../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../component/app_bar_title.dart';
import '../../component/async_value_handler.dart';
import '../../component/cached_manager.dart';
import '../home/component/stamp_rally.dart';

/// 完了済スタンプラリー詳細画面
class CompleteStampRallyViewPage extends StatelessWidget {
  const CompleteStampRallyViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(),
        centerTitle: true,
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
      value: ref.watch(currentPublicStampRallyProvider),
      builder: (stampRally) {
        return SingleChildScrollView(
          child: Column(
            children: [
              StampRallyThumbnail(
                stampRally: stampRally,
                cacheManager: ref.read(defaultCacheManager),
              ),
              GridView.builder(
                shrinkWrap: true,
                // GridView内でスクロールしないようにする
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(4),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: stampRally.spots.length,
                itemBuilder: (context, index) {
                  final spot = stampRally.spots[index];
                  return CachedNetworkImage(
                    imageUrl: spot.imageUrl,
                    cacheManager: ref.read(defaultCacheManager),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
