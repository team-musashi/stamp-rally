import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../component/m3/button.dart';
import '../../../../component/scaffold_messenger.dart';
import 'header.dart';

class SnackBarSection extends ConsumerWidget {
  const SnackBarSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SectionHeader(title: 'Snack Bar'),
        const Gap(20),
        FilledButton(
          onPressed: () {
            final state = ref.read(scaffoldMessengerKeyProvider).currentState!;
            state.showSnackBar(const SnackBar(content: Text('Hello!')));
          },
          child: const Text('Show SnackBar'),
        ),
        const Gap(20),
      ],
    );
  }
}
