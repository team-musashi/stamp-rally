import 'package:flutter/material.dart';

import '../../component/common_app_bar.dart';
import '../../component/delete_user.dart';

/// ホーム画面
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ハンバーガーメニューを表示。中身は仮
      drawer: createHamburgerMenu(),
      appBar: const CommonAppBar(
        title: 'ホーム',
        isDispBoundary: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              createDelimiterBlock('参加中のスタンプラリー'),
              createListViewFromListData(entryStampRallyList),
              createDelimiterBlock('開催中のスタンプラリー'),
              createListViewFromListData(openStampRallyList),
              const DeleteUserButton(),
            ],
          ),
        ),
      ),
    );
  }

  // start ヘルパーメソッド群
  /// ハンバーガーメニューを生成するヘルパーメソッド
  Drawer createHamburgerMenu() {
    // とりあえず中身の要素は仮作成
    return Drawer(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Item $index'),
          );
        },
      ),
    );
  }

  /// 区切りブロックを生成するヘルパーメソッド
  Widget createDelimiterBlock(String text) {
    return Column(
      children: [
        Divider(
          color: Colors.grey[350],
          thickness: 2,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        Divider(
          color: Colors.grey[350],
          thickness: 2,
        ),
      ],
    );
  }

  /// ListViewを生成するヘルパーメソッド
  Widget createListViewFromListData(List<DummyListItem> list) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        final item = list[index];
        return Container(
          margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey, //色
                spreadRadius: 2.5,
                blurRadius: 5,
                offset: Offset(1, 1),
              ),
            ],
            color: Colors.white,
          ),
          child: Row(
            children: [
              Image(
                image: NetworkImage(item.detail3),
                width: 200,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.content),
                    Text('開催場所： ${item.detail1}'),
                    Text('所要時間： ${item.detail2}'),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  // end ヘルパーメソッド群
}

/// ダミーのリストアイテムオブジェクト
// TODO(cobo): DB設計が終わったらそちらに置き換えるのでこれは必ず消す, https://github.com/team-musashi/stamp-rally/issues/22
class DummyListItem {
  DummyListItem(this.content, this.detail1, this.detail2, this.detail3);
  final String content;
  final String detail1;
  final String detail2;
  final String detail3;
}

// start ダミーデータ
final entryStampRallyList = [
  DummyListItem(
    '参加中スタラリ１',
    'ほげほげ',
    '10時間',
    'https://gahag.net/img/201608/27s/gahag-0119340780-1.jpg',
  ),
  DummyListItem(
    '参加中スタラリ２',
    'ふがふが',
    '5時間〜7時間',
    'https://gahag.net/img/201608/27s/gahag-0119419405-1.jpg',
  ),
];
final openStampRallyList = [
  DummyListItem(
    '開催中スタラリ１',
    'ぴよぴよ',
    '9時間',
    'https://gahag.net/img/201608/27s/gahag-0119324068-1.jpg',
  ),
  DummyListItem(
    '開催中スタラリ２',
    'ほがほが',
    '5時間〜7時間',
    'https://gahag.net/img/201608/27s/gahag-0119319721-1.jpg',
  ),
  DummyListItem(
    '開催中スタラリ３',
    'ふげふげ',
    '8時間〜15時間',
    'https://gahag.net/img/201608/26s/gahag-0119226962-1.jpg',
  ),
];
  // end ダミーデータ
