import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'entry_toggle_switch.dart';

/// 参加中画面
class EntryView extends StatelessWidget {
  const EntryView({super.key});

  @override
  Widget build(BuildContext context) {
    final view = EntryToggleSwitch.map.view;
    return Stack(
      children: [
        view,
        Padding(
          padding: const EdgeInsets.only(top: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ToggleSwitch(
                minWidth: 60,
                cornerRadius: 10,
                activeFgColor: Theme.of(context).colorScheme.primaryContainer,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.white,
                activeBgColor: const [Colors.white],
                totalSwitches: 2,
                icons: const [Icons.list, Icons.map_outlined],
                iconSize: 20,
                animate: true,
                curve: Curves.linearToEaseOut,
                onToggle: (index) {
                  // if (index != null) {
                  //   setState(() {
                  //     view = EntryToggleSwitch.values[index].view;
                  //   });
                  // }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
