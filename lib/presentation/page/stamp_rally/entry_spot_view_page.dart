import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/image_picker/image_picker_service.dart';
import '../../../application/image_picker/state/image_picker_result.dart';
import '../../../application/stamp_rally/state/current_entry_spot.dart';
import '../../component/async_value_handler.dart';
import '../../component/delimiter_block.dart';

/// 参加中スポット詳細画面
class EntrySpotViewPage extends StatelessWidget {
  const EntrySpotViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('スポット詳細'),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pickedImage = ref.watch(imagePickerResultProvider);
    return AsyncValueHandler(
      value: ref.watch(currentEntrySpotProvider),
      builder: (spot) {
        final address = spot.address;
        final tel = spot.tel;
        return Column(
          children: [
            // 撮影された画像が存在する場合、表示を切り替える
            pickedImage != null
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 300,
                        child: Image.file(
                          pickedImage,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('この画像をアップロードする'),
                      ),
                    ],
                  )
                // 撮影された画像が存在しない場合、スポットの写真を表示する
                : Image(
                    image: NetworkImage(spot.imageUrl),
                  ),
            Text(spot.title),
            if (address != null) Text(address),
            if (tel != null) Text(tel),
            DelimiterBlock(text: spot.summary),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await ref
                        .read(imagePickerServiceProvider)
                        .pickImageByCamera();
                  },
                  child: const Text('カメラを開く'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await ref
                        .read(imagePickerServiceProvider)
                        .pickImageByGallery();
                  },
                  child: const Text('ギャラリーを開く'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
