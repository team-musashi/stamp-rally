import 'package:flutter/material.dart';

import '../../component/common_app_bar.dart';
import '../../component/create_user.dart';

/// ログイン画面
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: 'ログイン',
        isDispBoundary: true,
      ),
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
