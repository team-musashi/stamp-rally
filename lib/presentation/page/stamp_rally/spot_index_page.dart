import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/stamp_rally/state/current_public_stamp_rally.dart';

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
    final spots = ref.watch(currentPublicStampRallyParamProvider).cache!.spots;
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: spots.length,
      itemBuilder: (context, index) {
        return Image(
          image: NetworkImage(spots[index].imageUrl),
        );
      },
    );
  }
}
