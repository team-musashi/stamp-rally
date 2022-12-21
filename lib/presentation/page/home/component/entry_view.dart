import 'package:flutter/material.dart';

import '../../stamp_rally/component/stamp_rally_display_mode.dart';

/// 参加中画面
class EntryView extends StatelessWidget {
  const EntryView({super.key});

  @override
  Widget build(BuildContext context) {
    return StampRallyDefaultTabController(
      initialMode: StampRallyDisplayMode.map,
      child: Stack(
        children: [
          TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: StampRallyDisplayMode.values
                .map((displayMode) => displayMode.view)
                .toList(),
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
