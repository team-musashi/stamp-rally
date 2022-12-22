import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/image_picker/state/current_picked_image.dart';
import '../../../../application/image_picker/state/image_picker_result.dart';
import '../../../../application/stamp_rally/stamp_rally_service.dart';
import '../../../../application/stamp_rally/state/uplode_spot_image_result.dart';
import '../../../../application/url_launcher/url_launcher_service.dart';
import '../../../../domain/repository/stamp_rally/entity/spot.dart';
import '../../../../util/extension.dart';
import '../../../component/cached_manager.dart';
import '../../../component/m3/button.dart';
import '../../../component/widget_ref.dart';
import 'spot_button.dart';
import 'stamp_rally_button.dart';
import 'stamp_rally_section.dart';

/// 横方向のパディング
const _horizontalPadding = 16.0;

/// スポット詳細
class SpotListView extends ConsumerWidget {
  const SpotListView({
    super.key,
    required this.spot,
  });

  final Spot spot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 画像取得結果を監視する
    ref.listenResult<void>(
      imagePickerResultProvider,
    );

    // スポット画像アップロード結果を監視する
    ref.listenResult<void>(
      uploadSpotImageResultProvider,
      completeMessage: 'スポット画像をアップロードしました。',
    );

    return Stack(
      children: [
        // スポット画像
        _SpotImageView(
          spot: spot,
        ),

        // スポットの説明
        _SpotExplanation(
          spot: spot,
          topMargin: 240,
        ),
      ],
    );
  }
}

/// スポット画像View
class _SpotImageView extends ConsumerWidget {
  const _SpotImageView({
    required this.spot,
  });

  final Spot spot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!spot.isEntry) {
      // 公開スポットの写真を表示
      return CachedNetworkImage(
        imageUrl: spot.imageUrl,
        cacheManager: ref.watch(defaultCacheManagerProvider),
      );
    }

    final pickedImage = ref.watch(currentPickedImageProvider);

    // アップロード前の画像があれば表示する
    if (pickedImage != null) {
      return Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.file(
              pickedImage,
              fit: BoxFit.cover,
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

    // 撮影日時がなければ公開スポットの写真を表示する
    final gotDate = spot.gotDate;
    if (gotDate == null) {
      return CachedNetworkImage(
        imageUrl: spot.imageUrl,
        cacheManager: ref.watch(defaultCacheManagerProvider),
      );
    }

    // 撮影日があれば撮影した写真を表示する
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: spot.uploadImageUrl!,
          cacheManager: ref.watch(defaultCacheManagerProvider),
        ),

        // 撮影日時
        Padding(
          padding: const EdgeInsets.only(top: 8, right: 8),
          child: Align(
            alignment: Alignment.topRight,
            child: _GotDateText(
              gotDate: gotDate,
            ),
          ),
        ),
      ],
    );
  }
}

/// 撮影日時テキスト
class _GotDateText extends StatelessWidget {
  const _GotDateText({
    required this.gotDate,
  });

  final DateTime gotDate;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          gotDate.toFormatString(format: 'yyyy/MM/dd HH:mm'),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

/// スポットの説明
class _SpotExplanation extends ConsumerWidget {
  const _SpotExplanation({
    required this.spot,
    required this.topMargin,
  });

  final Spot spot;
  final double topMargin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final address = spot.address;
    final tel = spot.tel;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(16),
          ),
          margin: EdgeInsets.only(top: topMargin),
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: _horizontalPadding,
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          right:
                              (spot.isEntry ? StampRallyButton.buttonSize : 0) +
                                  8,
                          bottom: 4,
                        ),
                        child: Text(
                          spot.title,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: 18,
                                  ),
                        ),
                      ),
                      const Divider(
                        thickness: 1.5,
                      ),
                      StampRallySection(
                        icon: Icons.summarize,
                        title: '概要',
                        body: spot.summary,
                      ),
                      if (address != null)
                        StampRallySection(
                          icon: Icons.location_on,
                          title: '住所',
                          body: address,
                          actions: [
                            _MapButton(spot: spot),
                          ],
                        ),
                      if (tel != null)
                        StampRallySection(
                          icon: Icons.phone,
                          title: '電話番号',
                          body: tel,
                        ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),

        // 撮影ボタン
        if (spot.isEntry)
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(
              top: topMargin - StampRallyButton.buttonSize / 2,
              right: 20,
            ),
            child: SnapShotSpotButton(
              spot: spot,
            ),
          ),
      ],
    );
  }
}

/// スポットの位置情報を元にマップアプリを開くボタン
class _MapButton extends ConsumerWidget {
  const _MapButton({
    required this.spot,
  });

  final Spot spot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 32,
      child: FilledButton(
        onPressed: () {
          ref
              .read(urlLauncherServiceProvider)
              .launch(spot.location.googleMapUrl);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
        child: const Text('MAPアプリを開く'),
      ),
    );
  }
}
