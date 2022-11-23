import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../component/delimiter_block.dart';

/// スタンプラリー詳細画面
class StampRallyExplanationPage extends ConsumerWidget {
  const StampRallyExplanationPage({required this.stampRally, super.key});
  final StampRally stampRally;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('スタンプラリー詳細')),
      body: Column(
        children: [
          Image(image: NetworkImage(stampRally.imageUrl)),
          Text(
            stampRally.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          //todo
          const Text('チェックポイント数'),
          Text('所要時間：${stampRally.requiredTime.toString()}時間'),
          DelimiterBlock(text: stampRally.explanation),
          ElevatedButton(
            onPressed: () {},
            child: const Text('参加する'),
          ),
        ],
      ),
    );
  }
}
