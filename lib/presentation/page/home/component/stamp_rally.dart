import 'package:flutter/material.dart';

import '../../../../domain/repository/stamp_rally/entity/stamp_rally.dart';

/// スタンプラリーのサムネイル画像
class StampRallyThumbnail extends StatelessWidget {
  const StampRallyThumbnail({
    super.key,
    required this.stampRally,
    this.padding = const EdgeInsets.all(8),
  });

  final StampRally stampRally;
  final EdgeInsets padding;

  static const radius = 16.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Image(
            image: NetworkImage(stampRally.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
