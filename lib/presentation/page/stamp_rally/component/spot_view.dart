import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/url_launcher/url_launcher_service.dart';
import '../../../../domain/repository/stamp_rally/entity/spot.dart';
import '../../../component/cached_manager.dart';
import '../../../component/m3/button.dart';
import 'stamp_rally_button.dart';
import 'stamp_rally_section.dart';

/// 横方向のパディング
const _horizontalPadding = 16.0;

/// 公開中スポット／参加中スポットの詳細
class SpotView extends ConsumerWidget {
  const SpotView({required this.spot, super.key});
  final Spot spot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        // スポット画像
        CachedNetworkImage(
          imageUrl: spot.imageUrl,
          cacheManager: ref.watch(defaultCacheManagerProvider),
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
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.only(top: topMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: _horizontalPadding,
              right: StampRallyButton.buttonSize + 28,
              top: 16,
              bottom: 4,
            ),
            child: Text(
              spot.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Divider(
            thickness: 1.5,
            indent: _horizontalPadding,
            endIndent: _horizontalPadding,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: _horizontalPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
