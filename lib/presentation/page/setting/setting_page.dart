import 'package:flutter/material.dart';

import '../../component/about_app.dart';
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          DeleteUserButton(),
          // Todo PackageInfoPlusから取得する
          AboutApp(
            applicationName: 'Stamp-Rally',
            applicationVersion: '1.0.0',
          )
        ],
      ),
    );
  }
}
