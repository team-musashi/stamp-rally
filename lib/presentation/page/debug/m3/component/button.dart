import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../component/m3/button.dart';
import 'header.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(title: 'Button'),
        const Gap(20),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Elevated'),
        ),
        const Gap(20),
        FilledButton(
          onPressed: () {},
          child: const Text('Filled'),
        ),
        const Gap(20),
        FilledTonalButton(
          onPressed: () {},
          child: const Text('Tonal'),
        ),
        const Gap(20),
        OutlinedButton(
          onPressed: () {},
          child: const Text('Outlined'),
        ),
        const Gap(20),
        TextButton(
          onPressed: () {},
          child: const Text('Text'),
        ),
        const Gap(20),
        FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.access_alarm),
        ),
        const Gap(20),
        FloatingActionButton.extended(
          onPressed: () {},
          label: const Text('New task'),
          icon: const Icon(Icons.add),
        ),
        const Gap(20),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.share),
        ),
        const Gap(20),
      ],
    );
  }
}
