import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'common.dart';

class ProgressIndicatorSection extends ConsumerWidget {
  const ProgressIndicatorSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: const [
        SectionHeader(title: 'Progress Indicator'),
        Gap(20),
        LinearProgressIndicator(),
        Gap(20),
        CircularProgressIndicator(),
        Gap(20),
      ],
    );
  }
}
