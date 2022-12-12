import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/stamp_rally/state/current_public_spot.dart';
import '../../component/async_value_handler.dart';
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
        return Column(
          children: [
            Image(
              image: NetworkImage(spot.imageUrl),
            ),
            Text(spot.title),
            DelimiterBlock(text: spot.summary),
          ],
        );
      },
    );
  }
}
