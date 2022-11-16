import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/user/user_service.dart';

/// ユーザー削除ボタン
class DeleteUserButton extends ConsumerWidget {
  const DeleteUserButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () => showDialog<void>(
        context: context,
        builder: (_) => const DeleteUserConfirmDialog(),
      ),
      child: Text(
        'すべてのデータを削除',
        style: TextStyle(
          color: Theme.of(context).colorScheme.error,
        ),
      ),
    );
  }
}

/// ユーザー削除確認ダイアログ
class DeleteUserConfirmDialog extends ConsumerWidget {
  const DeleteUserConfirmDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('ユーザーの削除'),
      content: const Text(
        'ユーザーを削除すると、すべての情報が削除され、元に戻すことができません。ユーザーを削除しますか？',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('キャンセル'),
        ),
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop();
            await ref.read(userServiceProvider).deleteUser();
          },
          child: const Text('削除'),
        ),
      ],
    );
  }
}
