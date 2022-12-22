import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

/// スタンプラリー詳細の表示モード
enum StampRallyDisplayMode {
  /// リスト表示
  list(
    icon: Icons.list,
  ),

  /// マップ表示
  map(
    icon: Icons.map_outlined,
  ),
  ;

  const StampRallyDisplayMode({
    required this.icon,
  });

  final IconData icon;
}

/// スタンプラリー詳細用のビルダー
class StampRallyViewBuilder extends StatelessWidget {
  const StampRallyViewBuilder({
    super.key,
    this.initialMode = StampRallyDisplayMode.list,
    required this.builder,
  });

  final StampRallyDisplayMode initialMode;
  final Widget Function(StampRallyDisplayMode mode) builder;

  @override
  Widget build(BuildContext context) {
    return StampRallyDefaultTabController(
      initialMode: initialMode,
      child: Stack(
        children: [
          TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: StampRallyDisplayMode.values.map(builder).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 16, right: 16),
                child: StampRallyDisplayModeSwitchButton(),
              ),
            ],
          ),
        ],
      ),
    );
  }
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
      animationDuration: Duration.zero,
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
      backgroundColor: colorScheme.background,
      buttonMargin: EdgeInsets.zero,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 17.5,
      ),
      labelStyle: TextStyle(
        color: colorScheme.primaryContainer,
      ),
      unselectedLabelStyle: TextStyle(
        color: colorScheme.primaryContainer,
      ),
      unselectedBackgroundColor: colorScheme.onSurfaceVariant,
      borderWidth: 2,
      borderColor: colorScheme.outline.withOpacity(0.2),
      unselectedBorderColor: colorScheme.outline.withOpacity(0.2),
      tabs: StampRallyDisplayMode.values
          .map(
            (mode) => Tab(
              icon: Icon(
                mode.icon,
                size: iconSize,
              ),
            ),
          )
          .toList(),
    );
  }
}
