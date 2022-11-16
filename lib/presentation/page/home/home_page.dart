import 'package:flutter/material.dart';

import '../../../config/router.dart';

/// ホーム画面
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
        actions: [
          IconButton(
            onPressed: () => const SettingRoute().push(context),
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: const Center(),
    );
  }
}
