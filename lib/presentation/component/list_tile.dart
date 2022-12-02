import 'package:flutter/material.dart';

/// 区切り線の高さ
const _dividerHeight = 1.0;

/// セクションヘッダー
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
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

/// セクション項目
class SectionItem extends StatelessWidget {
  const SectionItem({
    super.key,
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
