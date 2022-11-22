import 'package:flutter/material.dart';

/// アンカーテキスト
class AnchorText extends StatelessWidget {
  const AnchorText(this.text, {super.key});

  final String text;

  static TextStyle anchorStyleText(BuildContext context) => TextStyle(
        color: Theme.of(context).colorScheme.primary,
      );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: anchorStyleText(context),
    );
  }
}
