import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/url_launcher/url_launcher_service.dart';
import '../../../domain/entity/app_info.dart';
import '../../component/delete_user.dart';
import '../../component/list_tile.dart';
import '../../component/set_region.dart';
import '../../router.dart';

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
          SectionHeader(title: 'アカウント'),
          _SetRegion(),
          _DeleteUserItem(),

          SectionHeader(title: 'サポート'),
          _TermsOfServiceItem(),
          _PrivacyPolicyItem(),
          _AboutAppItem(),

          // デバッグモードのときだけ表示する
          if (kDebugMode) ...[
            SectionHeader(title: 'デバッグ'),
            _ComponentGalleryItem(),
          ],
        ],
      ),
    );
  }
}

class _SetRegion extends ConsumerWidget {
  const _SetRegion();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SectionItem(
      onTap: () => showDialog<void>(
        context: context,
        builder: (_) => const SetRegionDialog(),
      ),
      title: const Text('あなたの地域を設定'),
    );
  }
}

/// すべてのデータを削除
class _DeleteUserItem extends ConsumerWidget {
  const _DeleteUserItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SectionItem(
      onTap: () => showDialog<void>(
        context: context,
        builder: (_) => const DeleteUserConfirmDialog(),
      ),
      title: Text(
        'すべてのデータを削除',
        style: TextStyle(
          color: Theme.of(context).colorScheme.error,
        ),
      ),
    );
  }
}

/// 利用規約
class _TermsOfServiceItem extends ConsumerWidget {
  const _TermsOfServiceItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SectionItem(
      title: const Text('サービス利用規約について'),
      onTap: () async {
        await ref.read(urlLauncherServiceProvider).launch(
              ref.read(appInfoProvider).termsOfServiceUrl.toString(),
            );
      },
    );
  }
}

/// プライバシーポリシー
class _PrivacyPolicyItem extends ConsumerWidget {
  const _PrivacyPolicyItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SectionItem(
      title: const Text('プライバシーポリシー'),
      onTap: () async {
        await ref.read(urlLauncherServiceProvider).launch(
              ref.read(appInfoProvider).privacyPolicyUrl.toString(),
            );
      },
    );
  }
}

/// このアプリについて
class _AboutAppItem extends ConsumerWidget {
  const _AboutAppItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final info = ref.watch(appInfoProvider);
    return SectionItem(
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

/// Component Gallery
class _ComponentGalleryItem extends ConsumerWidget {
  const _ComponentGalleryItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SectionItem(
      title: const Text(ComponentGalleryRoute.title),
      onTap: () => const ComponentGalleryRoute().go(context),
    );
  }
}
