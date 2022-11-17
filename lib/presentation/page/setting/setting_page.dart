import 'package:flutter/material.dart';

import '../../component/delete_user.dart';

/// 設定画面
class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          ListTile(
            title: DeleteUserButton(),
          ),
          _AboutAppListTile(),
        ],
      ),
    );
  }
}

/// 「このアプリについて」のListTile
class _AboutAppListTile extends StatelessWidget {
  const _AboutAppListTile();

  @override
  Widget build(BuildContext context) {
    // Todo PackageInfoPlusのProviderから取得する
    const applicationName = 'Stamp-Rally';
    const applicationVersion = '1.0.0';

    return ListTile(
      title: const Text('このアプリについて'),
      subtitle: const Text('v$applicationVersion'),
      onTap: () {
        showAboutDialog(
          context: context,
          applicationName: applicationName,
          applicationVersion: applicationVersion,
          applicationIcon:
              const Icon(Icons.apple_sharp), // Todo アプリIconが決まったら差し替え
          applicationLegalese: '(C)2022 stamp-rally', // Todo 権利情報が決まったら差し替え
        );
      },
    );
  }
}
