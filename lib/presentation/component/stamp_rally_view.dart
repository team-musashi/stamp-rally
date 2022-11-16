import 'package:flutter/material.dart';

import '../../domain/repository/stamp_rally/entity/stamp_rally.dart';

/// スタンプラリー概要を表示するためのウィジェット
class StampRallyViewItem extends StatelessWidget {
  const StampRallyViewItem({required this.item, super.key});
  final StampRally item;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

/// スタンプラリー概要をリスト表示するためのウィジェット
class StampRallyListView extends StatelessWidget {
  const StampRallyListView({required this.stampRallyItemList, super.key});
  final List<StampRally> stampRallyItemList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: stampRallyItemList.length,
      itemBuilder: (BuildContext context, int index) {
        return StampRallyViewItem(item: stampRallyItemList[index]);
      },
    );
  }
}
