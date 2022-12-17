// ignore_for_file: lines_longer_than_80_chars

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/stamp_rally/stamp_rally_service.dart';
import '../../../application/stamp_rally/state/current_public_stamp_rally.dart';
import '../../../application/stamp_rally/state/enter_stamp_rally_result.dart';
import '../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../component/async_value_handler.dart';
import '../../component/cached_manager.dart';
import '../../component/delimiter_block.dart';
import '../../component/widget_ref.dart';
import '../../router.dart';

/// 公開スタンプラリー詳細画面
class PublicStampRallyViewPage extends StatelessWidget {
  const PublicStampRallyViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('スタンプラリー詳細'),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // スタンプラリー参加の結果を監視する
    ref.listenResult<StampRally?>(
      enterStampRallyResultProvider,
      completeMessage: 'スタンプラリーに参加しました。',
      complete: (stampRally) {
        if (stampRally != null) {
          const HomeRoute().go(context);
        }
      },
    );

    return AsyncValueHandler(
      value: ref.watch(currentPublicStampRallyProvider),
      builder: (stampRally) {
        return SingleChildScrollView(
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: stampRally.imageUrl,
                cacheManager: ref.read(defaultCacheManagerProvider),
              ),
              Text(
                stampRally.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('エリア：${stampRally.area}'),
              Text('チェックポイント数：${stampRally.spots.length}'),
              Text('所要時間：${stampRally.requiredTime.toString()}時間'),
              DelimiterBlock(text: stampRally.summary),
              ElevatedButton(
                onPressed: () async {
                  PublicSpotIndexRoute.fromStampRally(stampRally).go(context);
                },
                child: const Text('スポット一覧'),
              ),
              ElevatedButton(
                onPressed: stampRally.canEntry
                    ? () async {
                        await ref
                            .read(stampRallyServiceProvider)
                            .enterStampRally(stampRallyId: stampRally.id);
                      }
                    : null,
                child: const Text('参加する'),
              ),
            ],
          ),
        );
      },
    );
  }
}
