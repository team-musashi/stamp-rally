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
          _DelimiterListTile(
            title: DeleteUserButton(),
          ),
          _SectionHeader(title: 'サポート'),
          _TermsOfServiceListTile(),
          _PrivacyPolicyListTile(),
          _AboutAppListTile(),
          // デバッグモードのときだけ表示する
          if (kDebugMode) ...[
            _SectionHeader(title: 'デバッグ'),
            _ComponentGalleryListTile(),
          ],
        ],
      ),
    );
  }
}

/// 「利用規約」のListTile
class _TermsOfServiceListTile extends ConsumerWidget {
  const _TermsOfServiceListTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _DelimiterListTile(
      title: const Text('サービス利用規約について'),
      onTap: () async {
        await ref.read(urlLauncherServiceProvider).launch(
              ref.read(appInfoProvider).termsOfServiceUrl.toString(),
            );
      },
    );
  }
}

/// 「プライバシーポリシー」のListTile
class _PrivacyPolicyListTile extends ConsumerWidget {
  const _PrivacyPolicyListTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _DelimiterListTile(
      title: const Text('プライバシーポリシー'),
      onTap: () async {
        await ref.read(urlLauncherServiceProvider).launch(
              ref.read(appInfoProvider).privacyPolicyUrl.toString(),
            );
      },
    );
  }
}

/// 「このアプリについて」のListTile
class _AboutAppListTile extends ConsumerWidget {
  const _AboutAppListTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final info = ref.watch(appInfoProvider);
    return _DelimiterListTile(
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

/// セクションヘッダー
class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return _DelimiterListTile(
      title: Text(title),
      isHeaderCell: true,
    );
  }
}

/// 「Component Gallery」のListTile
class _ComponentGalleryListTile extends ConsumerWidget {
  const _ComponentGalleryListTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _DelimiterListTile(
      title: const Text(ComponentGalleryRoute.title),
      onTap: () => const ComponentGalleryRoute().go(context),
    );
  }
}

/// 区切り線がついたListTile
class _DelimiterListTile extends StatelessWidget {
  const _DelimiterListTile({
    required this.title,
    this.subtitle,
    this.onTap,
    this.isHeaderCell = false,
  });

  final Widget? title;
  final Widget? subtitle;
  final GestureTapCallback? onTap;
  final bool isHeaderCell;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: title,
          subtitle: subtitle,
          onTap: isHeaderCell ? null : onTap,
          tileColor:
              isHeaderCell ? null : Theme.of(context).colorScheme.surface,
        ),
        const Divider(
          height: 1,
        ),
      ],
    );
  }
}
