import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/stamp_rally/state/current_public_stamp_rally.dart';
import '../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../component/async_value_handler.dart';

/// スポット一覧画面
class SpotIndexPage extends StatelessWidget {
  const SpotIndexPage({super.key});

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
      value: ref.watch(currentPublicStampRallyProvider),
      builder: (stampRally) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: stampRally.spots.length,
          itemBuilder: (context, index) {
            final spot = stampRally.spots[index];
            return Image(
              image: NetworkImage(spot.imageUrl),
            );
          },
        );
      },
    );
  }
}
