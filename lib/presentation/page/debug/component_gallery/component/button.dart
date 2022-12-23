import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../component/m3/button.dart';
import '../../../../component/m3/icon_button.dart';
import 'common.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(title: 'Button'),
        const Gap(contentPadding),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Elevated'),
        ),
        const Gap(contentPadding),
        FilledButton(
          onPressed: () {},
          child: const Text('Filled'),
        ),
        const Gap(contentPadding),
        FilledTonalButton(
          onPressed: () {},
          child: const Text('Tonal'),
        ),
        const Gap(contentPadding),
        OutlinedButton(
          onPressed: () {},
          child: const Text('Outlined'),
        ),
        const Gap(contentPadding),
        TextButton(
          onPressed: () {},
          child: const Text('Text'),
        ),
        const Gap(contentPadding),
        FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.access_alarm),
        ),
        const Gap(contentPadding),
        FloatingActionButton.extended(
          onPressed: () {},
          label: const Text('New task'),
          icon: const Icon(Icons.add),
        ),
        const Gap(contentPadding),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_outline),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.bookmark),
            ),
          ],
        ),
        const Gap(contentPadding),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledIconButton(
              onPressed: () {},
              icon: const Icon(Icons.camera),
            ),
            FilledTonalIconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
            ),
            OutlinedIconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        const Gap(contentPadding),
      ],
    );
  }
}
