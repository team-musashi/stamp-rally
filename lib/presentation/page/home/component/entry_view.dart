import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'entry_toggle_switch.dart';

class EntryView extends StatefulWidget {
  const EntryView({super.key});

  @override
  State<EntryView> createState() => _EntryViewState();
}

class _EntryViewState extends State<EntryView> {
  Widget view = EntryToggleSwitch.details.view;

  @override
  Widget build(BuildContext context) {
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
                  if (index != null) {
                    setState(() {
                      view = EntryToggleSwitch.values[index].view;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
