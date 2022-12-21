import 'package:flutter/material.dart';

import '../../../component/map/map_switch_button.dart';
import 'entry_details_view.dart';
import 'entry_map_view.dart';

/// 参加中画面

class EntryView extends StatefulWidget {
  const EntryView({super.key});

  @override
  State<EntryView> createState() => _EntryViewState();
}

class _EntryViewState extends State<EntryView> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 1,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TabBarView(
          controller: tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            // 参加中スタンプラリー詳細
            EntryDetailsView(),
            // 参加中スタンプラリースポットマップ
            EntryMapView(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 15),
              child: MapSwitchButton(
                controller: tabController,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
