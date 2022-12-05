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
        StampRallyViewRoute.fromStampRally(item).push(context);
      },
      child: Container(
        width: 168,
        height: 112,
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
        child: Image(
          image: NetworkImage(item.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

/// スタンプラリー概要をリスト表示するためのウィジェット
class StampRallyListView extends ConsumerWidget {
  const StampRallyListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueHandler<List<StampRally>>(
      value: ref.watch(publicStampRalliesProvider),
      builder: (stampRallies) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: stampRallies.length,
          itemBuilder: (BuildContext context, int index) {
            return StampRallyViewItem(item: stampRallies[index]);
          },
        );
      },
    );
  }
}
