import 'package:flutter/material.dart';

/// セクションヘッダー
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.surfaceVariant,
        ),
      ),
      tileColor: Theme.of(context).colorScheme.onSurfaceVariant,
    );
  }
}
