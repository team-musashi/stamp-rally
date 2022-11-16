import 'package:flutter/material.dart';

import '../../component/delete_user.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: Column(
        children: const [
          DeleteUserButton(),
        ],
      ),
    );
  }
}
