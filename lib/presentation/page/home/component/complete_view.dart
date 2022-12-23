import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../../../domain/repository/stamp_rally/stamp_rally_repository.dart';
import '../../../../util/extension.dart';
import '../../../component/async_value_handler.dart';
import '../../../component/thumbnail.dart';
import '../../../router.dart';

/// 完了済画面
class CompleteView extends ConsumerStatefulWidget {
  const CompleteView({super.key});

  @override
  ConsumerState<CompleteView> createState() => _CompleteViewState();
}

class _CompleteViewState extends ConsumerState<CompleteView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return AsyncValueHandler<List<StampRally>>(
      value: ref.watch(completeStampRalliesProvider),
      builder: (stampRallies) {
        if (stampRallies.isEmpty) {
          return const _EmptyView();
        }

        return GridView.builder(
          padding: const EdgeInsets.all(4),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4 / 3,
          ),
          itemCount: stampRallies.length,
          itemBuilder: (context, index) {
            final stampRally = stampRallies[index];
            return InkWell(
              onTap: () {
                CompleteStampRallyViewRoute.fromStampRally(stampRally)
                    .go(context);
              },
              child: ThumbnailImage(
                imageUrl: stampRally.imageUrl,
                title: stampRally.updatedAt?.toFormatString() ?? '日付不明',
              ),
            );
          },
        );
      },
    );
  }
}

/// 完了済みのスタンプラリーがない場合の表示
class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'NO ACTIVE',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.surfaceVariant,
            ),
      ),
    );
  }
}
