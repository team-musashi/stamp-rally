import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/user/user_service.dart';
import 'm3/button.dart';

/// ユーザー削除確認ダイアログ
class DeleteUserConfirmDialog extends ConsumerWidget {
  const DeleteUserConfirmDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('確認'),
      content: const Text(
        'すべての情報が削除され、元に戻すことができません。すべてのデータを削除しますか？',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('キャンセル'),
        ),
        FilledButton(
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
