import 'package:flutter/material.dart';

/// 区切り文字のブロックを表現するウィジェット
class DelimiterBlock extends StatelessWidget {
  const DelimiterBlock({required this.text, super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Colors.grey[350],
          thickness: 2,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        Divider(
          color: Colors.grey[350],
          thickness: 2,
        ),
      ],
    );
  }
}
