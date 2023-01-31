import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'm3/button.dart';

/// 地域設定ダイアログ
class SetRegionDialog extends ConsumerWidget {
  const SetRegionDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('地域設定'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text('設定された地域以外のスタンプラリーが表示されなくなります。地域の変更はいつでも、何回でも可能です。'),
          RegionDropdownButton(),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('キャンセル'),
        ),
        FilledButton(
          onPressed: () async {
            Navigator.of(context).pop();
            // todo: 地域をDBに追加する処理
          },
          child: const Text('設定する'),
        )
      ],
    );
  }
}

class RegionDropdownButton extends ConsumerStatefulWidget {
  const RegionDropdownButton({super.key});

  @override
  _RegionDropdownButtonState createState() => _RegionDropdownButtonState();
}

class _RegionDropdownButtonState extends ConsumerState<RegionDropdownButton> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      // todo: 現在設定している地域を表示する
      hint: const Text('ヒント'),
      items: ['設定なし', '北海道', '東北', '関東', '中部', '近畿', '四国', '九州']
          .map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? value) {
        setState(() {
          selectedValue = value;
        });
      },
    );
  }
}
