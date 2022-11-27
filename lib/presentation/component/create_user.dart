import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/user/user_service.dart';

/// ユーザー作成ボタン
class CreateUserButton extends ConsumerWidget {
  const CreateUserButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 56),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => ref.read(userServiceProvider).createUser(),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 4),
          ),
          child: const Text(
            '同意して始める',
            style: TextStyle(
              fontSize: 18,
              color: Color.fromRGBO(255, 115, 241, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
