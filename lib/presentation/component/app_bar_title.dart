import 'package:flutter/material.dart';

import '../../util/assets/assets.gen.dart';

/// AppBarのタイトル
class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Assets.images.logoHeaderBurarry.image(
      height: 18,
    );
  }
}
