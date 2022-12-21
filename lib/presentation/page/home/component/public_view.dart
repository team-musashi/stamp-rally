import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../../../domain/repository/stamp_rally/stamp_rally_repository.dart';
import '../../../component/async_value_handler.dart';
import '../../../component/thumbnail.dart';
import '../../../router.dart';

/// 公開中画面
class PublicView extends ConsumerStatefulWidget {
  const PublicView({super.key});

  @override
  ConsumerState<PublicView> createState() => _PublicViewState();
}

class _PublicViewState extends ConsumerState<PublicView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return AsyncValueHandler<List<StampRally>>(
      value: ref.watch(publicStampRalliesProvider),
      builder: (stampRallies) {
        return GridView.builder(
          padding: const EdgeInsets.all(4),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: stampRallies.length,
          itemBuilder: (context, index) {
            final stampRally = stampRallies[index];
            return InkWell(
              onTap: () {
                PublicStampRallyViewRoute.fromStampRally(stampRally)
                    .go(context);
              },
              child: ThumbnailImage(
                imageUrl: stampRally.imageUrl,
              ),
            );
          },
        );
      },
    );
  }
}
