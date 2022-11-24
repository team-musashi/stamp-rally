import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../component/dialog.dart';
import '../../../../component/m3/button.dart';
import 'header.dart';

class DialogSection extends ConsumerWidget {
  const DialogSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SectionHeader(title: 'Dialog'),
        const Gap(20),
        FilledButton(
          onPressed: () async {
            await showDialog<void>(
              context: context,
              builder: (context) => const ErrorDialog(
                message: 'Error!',
              ),
            );
          },
          child: const Text('Show ErrorDialog'),
        ),
        const Gap(20),
      ],
    );
  }
}
