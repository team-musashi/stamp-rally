import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/stamp_rally/stamp_rally_service.dart';
import '../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../component/async_value_handler.dart';
import '../../component/delimiter_block.dart';

/// スタンプラリー詳細画面
class StampRallyViewPage extends ConsumerWidget {
  const StampRallyViewPage({required this.stampRally, super.key});
  final StampRally stampRally;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // アプリケーション層でStampRally.spotsにデータを詰めてもらう
    return AsyncValueHandler(
      value: ref.watch(fetchSpotsFromStampRallyProvider(stampRally)),
      builder: (stampRally) => Scaffold(
        appBar: AppBar(title: const Text('スタンプラリー詳細')),
        body: Column(
          children: [
            Image(image: NetworkImage(stampRally.imageUrl)),
            Text(
              stampRally.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('チェックポイント数：${stampRally.spots.length}'),
            Text('所要時間：${stampRally.requiredTime.toString()}時間'),
            DelimiterBlock(text: stampRally.explanation),
            ElevatedButton(
              onPressed: () {},
              child: const Text('参加する'),
            ),
          ],
        ),
      ),
    );
  }
}
