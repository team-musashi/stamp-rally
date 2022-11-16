import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../config/router.dart';
import '../../../domain/repository/stamp_rally/entity/spot.dart';
import '../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../component/delimiter_block.dart';
import '../../component/stamp_rally_view.dart';

/// ホーム画面
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
        actions: [
          IconButton(
            onPressed: () => const SettingRoute().push(context),
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const DelimiterBlock(text: '参加中のスタンプラリー'),
            StampRallyListView(stampRallyItemList: entryStampRallyList),
            const DelimiterBlock(text: '開催中のスタンプラリー'),
            StampRallyListView(stampRallyItemList: openStampRallyList),
          ],
        ),
      ),
    );
  }
}

// start ダミーデータ
final entryStampRallyList = [
  StampRally(
    id: 'a',
    explanation: 'A',
    place: 'ほげほげ',
    title: '参加中スタラリ１',
    requiredTime: 10,
    imageUrl: 'https://gahag.net/img/201608/27s/gahag-0119340780-1.jpg',
    spots: [const Spot(id: '', order: 1, imageUrl: '', point: GeoPoint(0, 0))],
    startDate: DateTime.now(),
    endDate: DateTime.now(),
  ),
  StampRally(
    id: 'b',
    explanation: 'B',
    place: 'ふがふが',
    title: '参加中スタラリ２',
    requiredTime: 7,
    imageUrl: 'https://gahag.net/img/201608/27s/gahag-0119419405-1.jpg',
    spots: [const Spot(id: '', order: 1, imageUrl: '', point: GeoPoint(0, 0))],
    startDate: DateTime.now(),
    endDate: DateTime.now(),
  ),
];
final openStampRallyList = [
  StampRally(
    id: 'c',
    explanation: 'C',
    place: 'ぴよぴよ',
    title: '開催中スタラリ１',
    requiredTime: 9,
    imageUrl: 'https://gahag.net/img/201608/27s/gahag-0119324068-1.jpg',
    spots: [const Spot(id: '', order: 1, imageUrl: '', point: GeoPoint(0, 0))],
    startDate: DateTime.now(),
    endDate: DateTime.now(),
  ),
  StampRally(
    id: 'd',
    explanation: 'D',
    place: 'ほがほが',
    title: '開催中スタラリ２',
    requiredTime: 6,
    imageUrl: 'https://gahag.net/img/201608/27s/gahag-0119319721-1.jpg',
    spots: [const Spot(id: '', order: 1, imageUrl: '', point: GeoPoint(0, 0))],
    startDate: DateTime.now(),
    endDate: DateTime.now(),
  ),
  StampRally(
    id: 'e',
    explanation: 'E',
    place: 'ふげふげ',
    title: '開催中スタラリ３',
    requiredTime: 11,
    imageUrl: 'https://gahag.net/img/201608/26s/gahag-0119226962-1.jpg',
    spots: [const Spot(id: '', order: 1, imageUrl: '', point: GeoPoint(0, 0))],
    startDate: DateTime.now(),
    endDate: DateTime.now(),
  ),
];
// end ダミーデータ
