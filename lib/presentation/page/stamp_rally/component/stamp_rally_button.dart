import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/stamp_rally/stamp_rally_service.dart';
import '../../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../../../util/assets/assets.gen.dart';
import '../../../component/m3/button.dart';

/// スタンプラリーに参加／完了／中断するボタン
class StampRallyControlButton extends ConsumerWidget {
  const StampRallyControlButton({
    super.key,
    required this.stampRally,
  });

  final StampRally stampRally;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (stampRally.isEntry) {
      // 参加スタンプラリーは「完了／中断」できる
      return CompleteStampRallyButton(
        stampRally: stampRally,
      );
    }

    // 公開スタンプラリーは「参加」できる
    return EnterStampRallyButton(
      stampRally: stampRally,
    );
  }
}

/// スタンプラリーに参加するボタン
class EnterStampRallyButton extends ConsumerWidget {
  const EnterStampRallyButton({
    super.key,
    required this.stampRally,
  });

  final StampRally stampRally;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StampRallyButton(
      onPressed: stampRally.canEntry
          ? () async {
              await ref
                  .read(stampRallyServiceProvider)
                  .enterStampRally(stampRallyId: stampRally.id);
            }
          : null,
      svgIcon: Assets.images.joinBurally,
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}

/// スタンプラリーを完了するボタン
class CompleteStampRallyButton extends ConsumerWidget {
  const CompleteStampRallyButton({
    super.key,
    required this.stampRally,
  });

  final StampRally stampRally;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StampRallyButton(
      onPressed: () async {
        // ダイアログを表示して完了か中断を選択してもらう
        await showDialog<void>(
          context: context,
          builder: (context) => _SelectorDialog(
            stampRally: stampRally,
          ),
        );
      },
      svgIcon: Assets.images.stopBurally,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
    );
  }
}

/// 完了か中断かを選択するダイアログ
class _SelectorDialog extends ConsumerWidget {
  const _SelectorDialog({
    required this.stampRally,
  });

  final StampRally stampRally;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('確認'),
      content: const Text('完了か中断を選択してください。\n中断した場合、結果は保存されません。'),
      actions: [
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop();
            await ref
                .read(stampRallyServiceProvider)
                .withdrawStampRally(stampRallyId: stampRally.id);
          },
          child: const Text('中断'),
        ),
        FilledButton(
          onPressed: () async {
            Navigator.of(context).pop();
            await ref
                .read(stampRallyServiceProvider)
                .completeStampRally(stampRallyId: stampRally.id);
          },
          child: const Text('完了'),
        ),
      ],
    );
  }
}

class StampRallyButton extends StatelessWidget {
  const StampRallyButton({
    super.key,
    required this.onPressed,
    required this.svgIcon,
    required this.backgroundColor,
  });

  final VoidCallback? onPressed;
  final SvgGenImage svgIcon;
  final Color backgroundColor;

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
          backgroundColor: backgroundColor,
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
