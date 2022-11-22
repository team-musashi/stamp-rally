import 'dart:async';

import 'package:stamp_rally/domain/repository/stamp_rally/entity/stamp_rally.dart';
import 'package:stamp_rally/domain/repository/stamp_rally/stamp_rally_repository.dart';

/// テスト用スタンプラリーリポジトリ
class MockStampRallyRepository implements StampRallyRepository {
  MockStampRallyRepository();
  final publicStampRallies = <StampRally>[
    StampRally(
      id: 'a',
      title: '１個目のタイトル',
      explanation: '１個目の詳細',
      place: '１個目の場所 ',
      requiredTime: 1,
      imageUrl: 'dummy',
      startDate: DateTime.now(),
    ),
    StampRally(
      id: 'b',
      title: '２個目のタイトル',
      explanation: '２個目の詳細',
      place: '２個目の場所 ',
      requiredTime: 2,
      imageUrl: 'dummy',
      startDate: DateTime.now(),
    ),
    StampRally(
      id: 'c',
      title: '３個目のタイトル',
      explanation: '３個目の詳細',
      place: '３個目の場所 ',
      requiredTime: 3,
      imageUrl: 'dummy',
      startDate: DateTime.now(),
    )
  ];

  @override
  Stream<List<StampRally>> changesEntryStampRallies() {
    // TODO(cobo): 参加中スタンプラリーの処理ができたらテストコードも一緒に書くこと,
    throw UnimplementedError();
  }

  @override
  Stream<List<StampRally>> changesPublicStampRallies() async* {
    yield publicStampRallies;
  }
}
