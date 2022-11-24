import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'common.dart';

class ChipSection extends StatelessWidget {
  const ChipSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(title: 'Chip'),
        const Gap(contentPadding),
        FilterChip(
          label: const Text('Filter'),
          selected: true,
          onSelected: (value) {},
        ),
        const Gap(contentPadding),
        InputChip(
          label: const Text('Input'),
          selected: true,
          onSelected: (value) {},
        ),
        const Gap(contentPadding),
      ],
    );
  }
}
