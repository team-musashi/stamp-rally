import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/user/user_service.dart';

/// ユーザー作成ボタン
class CreateUserButton extends ConsumerWidget {
  const CreateUserButton({
    super.key,
    required this.padding,
    this.buttonStyle,
    this.textStyle,
  });

  final EdgeInsetsGeometry padding;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: padding,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => ref.read(userServiceProvider).createUser(),
          style: buttonStyle,
          child: Text(
            '同意して始める',
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
