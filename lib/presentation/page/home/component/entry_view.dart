import 'package:flutter/material.dart';

import '../../stamp_rally/component/stamp_rally_display_mode.dart';
import 'entry_list_view.dart';
import 'entry_map_view.dart';

/// 参加中画面
class EntryView extends StatelessWidget {
  const EntryView({super.key});

  @override
  Widget build(BuildContext context) {
    return StampRallyViewBuilder(
      initialMode: StampRallyDisplayMode.map,
      builder: (mode) {
        switch (mode) {
          case StampRallyDisplayMode.list:
            return const EntryListView();
          case StampRallyDisplayMode.map:
            return const EntryMapView();
        }
      },
    );
  }
}
