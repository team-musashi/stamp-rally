import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/user/user_service.dart';

/// ユーザー作成ボタン
class CreateUserButton extends ConsumerWidget {
  const CreateUserButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () => ref.read(userServiceProvider).createUser(),
      child: const Text('ログイン'),
    );
  }
}
