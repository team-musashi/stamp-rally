import 'package:flutter/material.dart';

/// アプリ内共通のAppBar
class CommonAppBar extends StatelessWidget with PreferredSizeWidget {
  /// param：title -> バーに表示するタイトル
  /// param：isCenterTitle -> タイトルをバーの中央に表示するかどうか（true：表示する、false：表示しない）
  /// param：isDispBoundary -> 境界線を表示するかどうか（true:表示する、false：表示しない）
  const CommonAppBar({
    required this.title,
    this.isCenterTitle = true,
    this.isDispBoundary = false,
    this.automaticallyImplyLeading = true,
    this.foreColor = Colors.white,
    this.backColor = Colors.blue,
    super.key,
  });
  final String title;
  final bool isCenterTitle;
  final bool isDispBoundary;
  final bool automaticallyImplyLeading;
  final Color? foreColor;
  final Color? backColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      centerTitle: true,
      iconTheme: IconThemeData(color: foreColor),
      title: Text(
        title,
        style: TextStyle(color: foreColor),
      ),
      backgroundColor: backColor,
      elevation: isDispBoundary ? 2 : 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
