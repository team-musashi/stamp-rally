import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../component/m3/button.dart';
import 'common.dart';

class BottomSheetSection extends ConsumerWidget {
  const BottomSheetSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SectionHeader(title: 'Bottom Sheet'),
        const Gap(contentPadding),
        FilledButton(
          onPressed: () async {
            await showModalBottomSheet<void>(
              context: context,
              builder: (context) => const _ThemeModeSelectorBottomSheet(),
            );
          },
          child: const Text('Show BottomSheet'),
        ),
        const Gap(contentPadding),
      ],
    );
  }
}

/// 外観モード選択ボトムシート
class _ThemeModeSelectorBottomSheet extends StatelessWidget {
  const _ThemeModeSelectorBottomSheet();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: ThemeMode.values
            .map(
              (themeMode) => ListTile(
                title: Text(themeMode.name),
                onTap: () {},
              ),
            )
            .toList(),
      ),
    );
  }
}
