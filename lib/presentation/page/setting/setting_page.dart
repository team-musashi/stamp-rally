import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/package_info/package_info_service.dart';
import '../../component/async_value_handler.dart';
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
class _AboutAppListTile extends ConsumerWidget {
  const _AboutAppListTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueHandler(
      value: ref.watch(packageInfoProvider),
      builder: (info) => ListTile(
        title: const Text('このアプリについて'),
        subtitle: Text('v${info.version}'),
        onTap: () {
          showAboutDialog(
            context: context,
            applicationName: info.appName,
            applicationVersion: info.version,
            applicationIcon:
                const Icon(Icons.apple_sharp), // Todo アプリIconが決まったら差し替え
            applicationLegalese: '(C)2022 stamp-rally', // Todo 権利情報が決まったら差し替え
          );
        },
      ),
    );
  }
}
