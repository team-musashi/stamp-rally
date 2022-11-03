import 'package:flutter/material.dart';

import '../../component/create_user.dart';

/// ログイン画面
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CreateUserButton(),
          ],
        ),
      ),
    );
  }
}
