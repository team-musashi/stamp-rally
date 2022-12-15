import 'dart:async';

import 'package:stamp_rally/domain/repository/stamp_rally/entity/spot.dart';
import 'package:stamp_rally/domain/repository/stamp_rally/entity/stamp_rally.dart';
import 'package:stamp_rally/domain/repository/stamp_rally/stamp_rally_repository.dart';

/// テスト用スタンプラリーリポジトリ
class MockStampRallyRepository implements StampRallyRepository {
  MockStampRallyRepository();
  final publicStampRallies = <StampRally>[
    StampRally(
      id: 'a',
      title: '１個目のタイトル',
      summary: '１個目の詳細',
      area: '１個目の場所 ',
      requiredTime: 1,
      imageUrl: 'dummy',
      startDate: DateTime.now(),
    ),
    StampRally(
      id: 'b',
      title: '２個目のタイトル',
      summary: '２個目の詳細',
      area: '２個目の場所 ',
      requiredTime: 2,
      imageUrl: 'dummy',
      startDate: DateTime.now(),
    ),
    StampRally(
      id: 'c',
      title: '３個目のタイトル',
      summary: '３個目の詳細',
      area: '３個目の場所 ',
      requiredTime: 3,
      imageUrl: 'dummy',
      startDate: DateTime.now(),
    )
  ];

  @override
  Stream<List<StampRally>> publicStampRalliesChanges() async* {
    yield publicStampRallies;
  }

  @override
  Future<List<Spot>> fetchPublicSpots({required String publicStampRallyId}) {
    // TODO(cobo): implement fetchSpots
    throw UnimplementedError();
  }

  @override
  Future<List<Spot>> fetchEntrySpots({required String entryStampRallyId}) {
    // TODO(cobo): implement fetchSpots
    throw UnimplementedError();
  }

  @override
  Stream<StampRally?> entryStampRallyChanges() {
    // TODO(some): implement entryStampRallyChanges
    throw UnimplementedError();
  }

  @override
  Future<StampRally?> fetchEntryStampRally() {
    // TODO(some): implement fetchEntryStampRally
    throw UnimplementedError();
  }

  @override
  Future<List<StampRally>> fetchPublicStampRallies() {
    // TODO(some): implement fetchPublicStampRallies
    throw UnimplementedError();
  }

  @override
  Stream<List<StampRally>> completeStampRalliesChanges() {
    // TODO(some): implement completeStampRallyChanges
    throw UnimplementedError();
  }

  @override
  Future<List<Spot>> fetchCompleteSpots({
    required String completeStampRallyId,
  }) {
    // TODO(some): implement fetchCompleteSpots
    throw UnimplementedError();
  }

  @override
  Future<List<StampRally>> fetchCompleteStampRallies() {
    // TODO(some): implement fetchcompleteStampRally
    throw UnimplementedError();
  }
}
