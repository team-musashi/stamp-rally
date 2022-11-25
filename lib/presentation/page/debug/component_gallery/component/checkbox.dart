import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'common.dart';

class CheckboxSection extends StatelessWidget {
  const CheckboxSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(title: 'Checkbox'),
        const Gap(20),
        ...ThemeMode.values.map(
          (themeMode) => _ThemeModeCheckbox(
            themeMode: themeMode,
            checked: themeMode == ThemeMode.dark,
          ),
        ),
        const Gap(20),
      ],
    );
  }
}

class _ThemeModeCheckbox extends StatefulWidget {
  const _ThemeModeCheckbox({
    required this.themeMode,
    this.checked = false,
  });

  final ThemeMode themeMode;
  final bool checked;

  @override
  State<_ThemeModeCheckbox> createState() => _ThemeModeCheckboxState();
}

class _ThemeModeCheckboxState extends State<_ThemeModeCheckbox> {
  late bool checked;

  @override
  void initState() {
    super.initState();
    checked = widget.checked;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: checked,
          onChanged: (value) {
            if (value != null) {
              setState(() {
                checked = value;
              });
            }
          },
        ),
        const Gap(contentPadding),
        Text(widget.themeMode.name),
      ],
    );
  }
}
