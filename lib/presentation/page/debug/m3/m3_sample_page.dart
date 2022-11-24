import 'package:flutter/material.dart';

import 'component/bottom_sheet.dart';
import 'component/button.dart';
import 'component/card.dart';
import 'component/chip.dart';
import 'component/dialog.dart';
import 'component/list.dart';
import 'component/progress_indicator.dart';
import 'component/radio.dart';
import 'component/snack_bar.dart';
import 'component/text_field.dart';

/// マテリアルデザイン3のコンポーネントを確認するサンプル画面
class M3SamplePage extends StatelessWidget {
  const M3SamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('M3 サンプル'),
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
          TextFieldSection(),
        ],
      ),
    );
  }
}
