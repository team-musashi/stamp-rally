import 'package:flutter/material.dart';

import '../../../component/stamp_rally_view.dart';

/// 公開中画面
class PublicView extends StatelessWidget {
  const PublicView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: StampRallyListView(),
    );
  }
}
