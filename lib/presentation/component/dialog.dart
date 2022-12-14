import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'm3/button.dart';

/// ダイアログ表示用のGlobalKey
final navigatorKeyProvider = Provider(
  (_) => GlobalKey<NavigatorState>(),
);

/// エラーダイアログ
class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('エラー'),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        ),
      ],
    );
  }
}

/// 確認ダイアログ
class ConfirmDialog extends ConsumerWidget {
  const ConfirmDialog({
    super.key,
    required this.content,
    required this.onApproved,
  });

  final String content;
  final VoidCallback? onApproved;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('確認'),
      content: Text(
        content,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('いいえ'),
        ),
        FilledButton(
          onPressed: onApproved,
          child: const Text('はい'),
        ),
      ],
    );
  }
}
