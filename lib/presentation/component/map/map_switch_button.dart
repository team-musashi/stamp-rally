import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

/// 地図表示と一覧表示を切り替えるボタン
class MapSwitchButton extends StatelessWidget {
  const MapSwitchButton({
    super.key,
    required this.controller,
  });

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return ButtonsTabBar(
      controller: controller,
      backgroundColor: Colors.white,
      // ignore: use_named_constants
      buttonMargin: const EdgeInsets.symmetric(),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 17.5,
      ),
      borderColor: Colors.white,
      labelStyle: TextStyle(
        color: Theme.of(context).colorScheme.primaryContainer,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(
        color: Colors.white,
      ),
      unselectedBackgroundColor: Colors.grey,
      unselectedBorderColor: Colors.white,
      tabs: const [
        Tab(icon: Icon(Icons.list)),
        Tab(icon: Icon(Icons.map_outlined)),
      ],
    );
  }
}
