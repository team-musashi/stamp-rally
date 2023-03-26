import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/user/user_service.dart';
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
        Consumer(
          builder: (context, ref, _) {
            final selectedRegion = ref.watch(_selectedRegionProvider);
            return FilledButton(
              onPressed: selectedRegion != null
                  ? () async {
                      Navigator.of(context).pop();
                      await ref.read(userServiceProvider).updateUser(
                            region: selectedRegion,
                          );
                    }
                  : null,
              child: const Text('設定する'),
            );
          },
        ),
      ],
    );
  }
}

// 地域を設定するドロップダウンボタン
class RegionDropdownButton extends ConsumerWidget {
  const RegionDropdownButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButton<String>(
      value: ref.watch(_selectedRegionProvider),
      hint: const Text('ヒント'),
      items: ['設定なし', '北海道', '東北', '関東', '中部', '近畿', '四国', '九州']
          .map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? value) =>
          ref.read(_selectedRegionProvider.notifier).state = value,
    );
  }
}

/// ドロップダウンメニューで選択されている地域を保持する
final _selectedRegionProvider = StateProvider.autoDispose<String?>(
  (ref) {
    return null;
  },
);
