import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../domain/repository/stamp_rally/stamp_rally_repository.dart';
import '../router.dart';
import 'async_value_handler.dart';

/// スタンプラリー概要を表示するためのウィジェット
class StampRallyViewItem extends StatelessWidget {
  const StampRallyViewItem({required this.item, super.key});
  final StampRally item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        switch (item.type) {
          case StampRallyType.public:
            PublicStampRallyViewRoute.fromStampRally(item).go(context);
            break;
          case StampRallyType.entry:
            EntryStampRallyViewRoute.fromStampRally(item).go(context);
            break;
        }
      },
      child: Container(
        margin: const EdgeInsets.only(top: 12, left: 6, right: 6),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey, //色
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(1, 1),
            ),
          ],
          color: Colors.white,
        ),
        child: Row(
          children: [
            Image(
              image: NetworkImage(item.imageUrl),
              width: 200,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('開催場所： ${item.place}'),
                  Text('所要時間： ${item.requiredTime}時間'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// 公開中スタンプラリー概要をリスト表示するためのウィジェット
class PublicStampRallyListView extends ConsumerWidget {
  const PublicStampRallyListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueHandler<List<StampRally>>(
      value: ref.watch(publicStampRalliesProvider),
      builder: _buildStampRallies,
    );
  }
}

/// 参加中スタンプラリー概要をリスト表示するためのウィジェット
class EntryStampRallyListView extends ConsumerWidget {
  const EntryStampRallyListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueHandler<List<StampRally>>(
      value: ref.watch(entryStampRalliesProvider),
      builder: _buildStampRallies,
    );
  }
}

Widget _buildStampRallies(List<StampRally> stampRallies) {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: stampRallies.length,
    itemBuilder: (BuildContext context, int index) {
      return StampRallyViewItem(item: stampRallies[index]);
    },
  );
}
