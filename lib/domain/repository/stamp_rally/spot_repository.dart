import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'entity/spot.dart';

/// スタンプラリーリポジトリプロバイダー
final spotRepositoryProvider = Provider<SpotRepository>(
  (_) => throw UnimplementedError('Provider was not initialized'),
);

/// スポットリポジトリ
abstract class SpotRepository {
  /// StampRally.idに紐づくスポットを取得する
  Future<List<Spot>> fetchSpots({required String stampRallyId});
}
