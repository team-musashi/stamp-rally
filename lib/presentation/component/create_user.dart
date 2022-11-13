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
      //TODO：ボタンの文言は https://github.com/team-musashi/stamp-rally/issues/21 が終了してから
      child: const Text('ログイン'),
    );
  }
}
