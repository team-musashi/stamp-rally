import 'package:flutter/material.dart';

/// ボタン用のSizedBox
class ButtonBox extends StatelessWidget {
  const ButtonBox({
    super.key,
    this.height = 48,
    this.width = double.infinity,
    required this.child,
  });

  final double? height;
  final double? width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: child,
    );
  }
}
