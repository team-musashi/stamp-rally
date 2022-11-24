import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'header.dart';

class RadioSection extends StatelessWidget {
  const RadioSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SectionHeader(title: 'Radio'),
        Gap(20),
        _ThemeModeRadioGroup(),
        Gap(20),
      ],
    );
  }
}

class _ThemeModeRadioGroup extends StatefulWidget {
  const _ThemeModeRadioGroup();

  @override
  State<_ThemeModeRadioGroup> createState() => _ThemeModeRadioGroupState();
}

class _ThemeModeRadioGroupState extends State<_ThemeModeRadioGroup> {
  ThemeMode current = ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ThemeMode.values
          .map(
            (themeMode) => Row(
              children: [
                Radio<ThemeMode>(
                  value: themeMode,
                  groupValue: current,
                  onChanged: (value) {
                    setState(() {
                      if (value != null) {
                        current = value;
                      }
                    });
                  },
                ),
                const Gap(20),
                Text(themeMode.name),
              ],
            ),
          )
          .toList(),
    );
  }
}
