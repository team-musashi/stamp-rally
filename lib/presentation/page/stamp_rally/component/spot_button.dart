import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/image_picker/image_picker_service.dart';
import '../../../../domain/repository/stamp_rally/entity/spot.dart';
import '../../../../util/assets/assets.gen.dart';
import 'stamp_rally_button.dart';

/// スポットの写真を撮影するボタン
class SnapShotSpotButton extends ConsumerWidget {
  const SnapShotSpotButton({
    super.key,
    required this.spot,
  });

  final Spot spot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final effectiveIcon =
        spot.isStamped ? Assets.images.stopBurally : Assets.images.joinBurally;
    final effectiveBackgroundColor = spot.isStamped
        ? Theme.of(context).colorScheme.primaryContainer
        : Theme.of(context).colorScheme.background;
    return StampRallyButton(
      onPressed: () async {
        // ダイアログを表示してカメラかギャラリーを選択してもらう
        await showDialog<void>(
          context: context,
          builder: (context) => _SelectorDialog(
            spot: spot,
          ),
        );
      },
      svgIcon: effectiveIcon,
      backgroundColor: effectiveBackgroundColor,
    );
  }
}

/// カメラかギャラリーかを選択するダイアログ
class _SelectorDialog extends ConsumerWidget {
  const _SelectorDialog({
    required this.spot,
  });

  final Spot spot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleDialog(
      children: [
        ListTile(
          title: const Center(
            child: Text('カメラ'),
          ),
          onTap: () async {
            Navigator.of(context).pop();
            await ref
                .read(imagePickerServiceProvider)
                .pickImageByCamera(spot: spot);
          },
        ),
        const Divider(),
        ListTile(
          title: const Center(
            child: Text('ギャラリー'),
          ),
          onTap: () async {
            Navigator.of(context).pop();
            await ref
                .read(imagePickerServiceProvider)
                .pickImageByGallery(spot: spot);
          },
        ),
      ],
    );
  }
}
