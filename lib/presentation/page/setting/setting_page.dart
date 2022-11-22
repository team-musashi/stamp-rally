import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entity/app_info.dart';
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
    final info = ref.watch(appInfoProvider);
    return ListTile(
      title: const Text('このアプリについて'),
      subtitle: Text(info.version),
      onTap: () {
        showAboutDialog(
          context: context,
          applicationName: info.appName,
          applicationVersion: '${info.version} build${info.buildNumber}',
          applicationIcon: SizedBox.square(
            dimension: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(info.iconImagePath),
            ),
          ),
          applicationLegalese: info.copyRight,
        );
      },
    );
  }
}
