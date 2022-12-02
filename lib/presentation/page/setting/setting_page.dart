import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/url_launcher/url_launcher_service.dart';
import '../../../domain/entity/app_info.dart';
import '../../component/delete_user.dart';
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
          _SectionHeader(title: 'アカウント'),
          _DeleteUserItem(),

          _SectionHeader(title: 'サポート'),
          _TermsOfServiceItem(),
          _PrivacyPolicyItem(),
          _AboutAppItem(),

          // デバッグモードのときだけ表示する
          if (kDebugMode) ...[
            _SectionHeader(title: 'デバッグ'),
            _ComponentGalleryItem(),
          ],
        ],
      ),
    );
  }
}

/// すべてのデータを削除
class _DeleteUserItem extends ConsumerWidget {
  const _DeleteUserItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _SectionItem(
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
    return _SectionItem(
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
    return _SectionItem(
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
    return _SectionItem(
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

/// 区切り線の高さ
const _dividerHeight = 1.0;

/// セクションヘッダー
class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const Divider(
          height: _dividerHeight,
        ),
      ],
    );
  }
}

/// Component Gallery
class _ComponentGalleryItem extends ConsumerWidget {
  const _ComponentGalleryItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _SectionItem(
      title: const Text(ComponentGalleryRoute.title),
      onTap: () => const ComponentGalleryRoute().go(context),
    );
  }
}

/// セクション項目
class _SectionItem extends StatelessWidget {
  const _SectionItem({
    required this.title,
    this.subtitle,
    this.onTap,
  });

  final Widget? title;
  final Widget? subtitle;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: title,
          subtitle: subtitle,
          onTap: onTap,
          tileColor: Theme.of(context).colorScheme.surface,
        ),
        const Divider(
          height: _dividerHeight,
        ),
      ],
    );
  }
}
