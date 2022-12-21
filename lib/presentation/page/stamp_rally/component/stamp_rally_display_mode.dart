import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import '../../home/component/entry_details_view.dart';
import '../../home/component/entry_map_view.dart';

/// スタンプラリー詳細の表示モード
enum StampRallyDisplayMode {
  /// リスト表示
  list(
    icon: Icons.list,
    view: EntryDetailsView(),
  ),

  /// マップ表示
  map(
    icon: Icons.map_outlined,
    view: EntryMapView(),
  ),
  ;

  const StampRallyDisplayMode({
    required this.icon,
    required this.view,
  });

  final IconData icon;
  final Widget view;
}

/// スタンプラリー詳細用のDefaultTabController
class StampRallyDefaultTabController extends StatelessWidget {
  const StampRallyDefaultTabController({
    super.key,
    required this.child,
    this.initialMode = StampRallyDisplayMode.list,
  });

  final Widget child;
  final StampRallyDisplayMode initialMode;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: initialMode.index,
      length: StampRallyDisplayMode.values.length,
      child: child,
    );
  }
}

/// 地図表示と一覧表示を切り替えるボタン
class StampRallyDisplayModeSwitchButton extends StatelessWidget {
  const StampRallyDisplayModeSwitchButton({
    super.key,
    this.controller,
  });

  final TabController? controller;
  static const iconSize = 32.0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ButtonsTabBar(
      controller: controller,
      backgroundColor: colorScheme.surfaceVariant,
      buttonMargin: EdgeInsets.zero,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 17.5,
      ),
      labelStyle: TextStyle(
        color: colorScheme.primaryContainer,
      ),
      unselectedLabelStyle: TextStyle(
        color: colorScheme.surfaceVariant,
      ),
      unselectedBackgroundColor: colorScheme.onSurfaceVariant.withOpacity(0.5),
      tabs: const [
        Tab(
          icon: Icon(
            Icons.list,
            size: iconSize,
          ),
        ),
        Tab(
          icon: Icon(
            Icons.map_outlined,
            size: iconSize,
          ),
        ),
      ],
    );
  }
}
