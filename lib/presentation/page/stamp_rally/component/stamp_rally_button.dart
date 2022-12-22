import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/stamp_rally/stamp_rally_service.dart';
import '../../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../../../util/assets/assets.gen.dart';

/// スタンプラリーに参加するボタン
class EnterStampRallyButton extends ConsumerWidget {
  const EnterStampRallyButton({
    super.key,
    required this.stampRally,
  });

  final StampRally stampRally;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _StampRallyButton(
      onPressed: stampRally.canEntry
          ? () async {
              await ref
                  .read(stampRallyServiceProvider)
                  .enterStampRally(stampRallyId: stampRally.id);
            }
          : null,
      svgIcon: Assets.images.joinBurally,
    );
  }
}

/// スタンプラリーを中断するボタン
class WithdrawStampRallyButton extends ConsumerWidget {
  const WithdrawStampRallyButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}

class _StampRallyButton extends StatelessWidget {
  const _StampRallyButton({
    required this.onPressed,
    required this.svgIcon,
  });

  final VoidCallback? onPressed;
  final SvgGenImage svgIcon;

  static const buttonSize = 80.0;
  static const iconSize = 48.0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox.square(
      dimension: buttonSize,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 10,
          backgroundColor: colorScheme.background,
          disabledBackgroundColor: colorScheme.surfaceVariant,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.zero,
        ),
        child: svgIcon.svg(
          height: iconSize,
          width: iconSize,
        ),
      ),
    );
  }
}
