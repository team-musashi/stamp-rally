import 'package:flutter/material.dart';

import '../../../router.dart';
import 'component/bottom_sheet.dart';
import 'component/button.dart';
import 'component/card.dart';
import 'component/checkbox.dart';
import 'component/chip.dart';
import 'component/dialog.dart';
import 'component/list.dart';
import 'component/progress_indicator.dart';
import 'component/radio.dart';
import 'component/snack_bar.dart';
import 'component/text_field.dart';

/// コンポーネントギャラリー画面
class ComponentGalleryPage extends StatelessWidget {
  const ComponentGalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ComponentGalleryRoute.title),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          ButtonSection(),
          CardSection(),
          ProgressIndicatorSection(),
          DialogSection(),
          SnackBarSection(),
          BottomSheetSection(),
          ListSection(),
          ChipSection(),
          RadioSection(),
          CheckboxSection(),
          TextFieldSection(),
        ],
      ),
    );
  }
}
