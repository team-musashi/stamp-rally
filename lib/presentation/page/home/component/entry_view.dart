import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import 'entry_details_view.dart';
import 'entry_map_view.dart';

/// 参加中画面
class EntryView extends StatelessWidget {
  const EntryView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Stack(
        children: [
          const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              EntryDetailsView(),
              EntryMapView(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, right: 15),
                child: ButtonsTabBar(
                  backgroundColor: Colors.white,
                  // ignore: use_named_constants
                  buttonMargin: const EdgeInsets.symmetric(),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
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
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
