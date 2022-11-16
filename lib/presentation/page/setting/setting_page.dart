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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DeleteUserButton(),
          GestureDetector(
            onTap: () => showAboutDialog(
                context: context,
                applicationName: 'Stamp-Rally',
                applicationVersion: '1.0.0',
                applicationIcon: const Icon(Icons.apple_sharp),
                applicationLegalese: '(C)2022 stamp-rally'),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('このアプリについて', style: TextStyle(fontSize: 16)),
                  Text(
                    'v1.0.0',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
