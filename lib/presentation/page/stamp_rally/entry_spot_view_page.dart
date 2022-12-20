import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/image_picker/image_picker_service.dart';
import '../../../application/image_picker/state/current_picked_image.dart';
import '../../../application/image_picker/state/image_picker_result.dart';
import '../../../application/stamp_rally/stamp_rally_service.dart';
import '../../../application/stamp_rally/state/current_entry_spot.dart';
import '../../../application/stamp_rally/state/uplode_spot_image_result.dart';
import '../../../domain/repository/stamp_rally/entity/spot.dart';
import '../../../util/extension.dart';
import '../../component/async_value_handler.dart';
import '../../component/delimiter_block.dart';
import '../../component/widget_ref.dart';

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
    // 画像取得結果を監視する
    ref.listenResult<void>(
      imagePickerResultProvider,
    );

    // スポット画像アップロード結果を監視する
    ref.listenResult<void>(
      uploadSpotImageResultProvider,
      completeMessage: 'スポット画像のアップロードに成功しました。',
    );

    return SingleChildScrollView(
      child: AsyncValueHandler(
        value: ref.watch(currentEntrySpotProvider),
        builder: (spot) {
          final address = spot.address;
          final tel = spot.tel;
          final gotDate = spot.gotDate;
          return Column(
            children: [
              _ImageView(spot: spot),
              Text(spot.title),
              if (address != null) Text(address),
              if (tel != null) Text(tel),
              if (gotDate != null)
                Text(gotDate.toFormatString(format: 'yyyy/MM/dd HH:mm')),
              DelimiterBlock(text: spot.summary),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await ref
                          .read(imagePickerServiceProvider)
                          .pickImageByCamera(spot: spot);
                    },
                    child: const Text('カメラを開く'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await ref
                          .read(imagePickerServiceProvider)
                          .pickImageByGallery(spot: spot);
                    },
                    child: const Text('ギャラリーを開く'),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

/// 画像View
class _ImageView extends ConsumerWidget {
  const _ImageView({
    required this.spot,
  });

  final Spot spot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pickedImage = ref.watch(currentPickedImageProvider);

    // アップロード前の画像があれば表示する
    if (pickedImage != null) {
      return Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 300,
            child: Image.file(
              pickedImage,
            ),
          ),
          // アップロードボタン
          ElevatedButton(
            onPressed: () async {
              await ref.read(stampRallyServiceProvider).uploadSpotImage(
                    spot: spot,
                    image: pickedImage,
                  );
            },
            child: const Text('この画像をアップロードする'),
          ),
        ],
      );
    }

    // アップロード済みの画像URLがあれば表示する
    final uploadImageUrl = spot.uploadImageUrl;
    if (uploadImageUrl != null) {
      return Column(
        children: [
          SizedBox(
            height: 300,
            child: Image.network(uploadImageUrl),
          ),
        ],
      );
    }

    // 公開スポットの画像を表示する
    return Image(
      image: NetworkImage(spot.imageUrl),
    );
  }
}
