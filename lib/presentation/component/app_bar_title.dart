import 'package:flutter/material.dart';

import '../../util/assets/assets.gen.dart';

/// AppBarのタイトル
class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Todo: アイコンが確定次第差し替える
        Assets.images.iconStamp.image(
          height: 12,
          color: Theme.of(context).colorScheme.primary,
        ),
        Assets.images.logoStampRarry.image(
          height: 32,
          color: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }
}
