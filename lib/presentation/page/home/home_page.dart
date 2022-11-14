import 'package:flutter/material.dart';

import '../../component/common_app_bar.dart';
import '../../component/delete_user.dart';

/// ホーム画面
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: 'ホーム',
        isDispBoundary: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            DeleteUserButton(),
          ],
        ),
      ),
    );
  }
}
