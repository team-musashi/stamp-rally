import 'dart:async';
import 'dart:io';

import 'package:stamp_rally/domain/entity/value_object/geo_location.dart';
import 'package:stamp_rally/domain/repository/stamp_rally/entity/spot.dart';
import 'package:stamp_rally/domain/repository/stamp_rally/entity/stamp_rally.dart';
import 'package:stamp_rally/domain/repository/stamp_rally/stamp_rally_repository.dart';

/// テスト用スタンプラリーリポジトリ
class MockStampRallyRepository implements StampRallyRepository {
  MockStampRallyRepository() {
    publicStampRallies = <StampRally>[
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

    entryStampRally = publicStampRallies.last;

    entrySpots = <Spot>[
      const Spot(
        id: 'c-1',
        imageUrl: '',
        isEntry: true,
        location: GeoLocation(latitude: 0, longitude: 0),
        order: 1,
        stampRallyId: 'c',
        summary: '',
        title: '',
      ),
      const Spot(
        id: 'c-2',
        imageUrl: '',
        isEntry: true,
        location: GeoLocation(latitude: 0, longitude: 0),
        order: 2,
        stampRallyId: 'c',
        summary: '',
        title: '',
      ),
    ];
  }
  late List<StampRally> publicStampRallies;

  late StampRally? entryStampRally;

  late List<Spot> entrySpots;

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
  Future<List<Spot>> fetchEntrySpots({
    required String entryStampRallyId,
  }) async {
    return entrySpots;
  }

  @override
  Stream<StampRally?> entryStampRallyChanges() async* {
    yield entryStampRally;
  }

  @override
  Future<StampRally?> fetchEntryStampRally() async {
    return entryStampRally;
  }

  @override
  Future<List<StampRally>> fetchPublicStampRallies() async {
    return publicStampRallies;
  }

  @override
  Stream<List<StampRally>> completeStampRalliesChanges() {
    // TODO(some): implement completeStampRallyChanges
    throw UnimplementedError();
  }

  @override
  Future<List<StampRally>> fetchCompleteStampRallies() async {
    // TODO(some): implement fetchcompleteStampRally
    throw UnimplementedError();
  }

  @override
  Future<void> uploadSpotImage({required Spot spot, required File image}) {
    // TODO(some): implement uploadSpotImage
    throw UnimplementedError();
  }

  @override
  Stream<List<Spot>>? entrySpotsChanges({
    required String entryStampRallyId,
  }) async* {
    yield entrySpots;
  }
}
