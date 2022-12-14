import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/// 縦方向のパディング
const _verticalPadding = 8.0;

/// スタンプラリー用のセクション
class StampRallySection extends StatelessWidget {
  const StampRallySection({
    super.key,
    required this.icon,
    required this.title,
    required this.body,
    this.actions = const [],
  });

  final IconData icon;
  final String title;
  final String body;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StampRallyHeader(
          icon: icon,
          title: title,
          actions: actions,
        ),
        const Gap(_verticalPadding),
        Text(
          body,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const Gap(_verticalPadding * 2),
      ],
    );
  }
}

/// スタンプラリー用のヘッダ
class StampRallyHeader extends StatelessWidget {
  const StampRallyHeader({
    super.key,
    required this.icon,
    required this.title,
    this.actions = const [],
  });

  final IconData icon;
  final String title;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        const Gap(8),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.primaryContainer,
                fontWeight: FontWeight.bold,
              ),
        ),
        if (actions.isNotEmpty) ...[
          const Gap(8),
          ...actions,
        ],
      ],
    );
  }
}
