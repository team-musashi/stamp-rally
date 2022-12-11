import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/stamp_rally/state/current_public_stamp_rally.dart';
import '../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../component/async_value_handler.dart';
import '../../component/delimiter_block.dart';

/// スポット詳細画面
class PublicSpotDetailPage extends StatelessWidget {
  const PublicSpotDetailPage({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('スポット詳細'),
      ),
      body: _Body(index: index),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({required this.index});

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueHandler<StampRally>(
      value: ref.watch(currentPublicStampRallyProvider),
      builder: (stampRally) {
        return Column(
          children: [
            Image(
              image: NetworkImage(stampRally.spots[index].imageUrl),
            ),
            Text(stampRally.spots[index].title),
            DelimiterBlock(text: stampRally.spots[index].explanation),
          ],
        );
      },
    );
  }
}
