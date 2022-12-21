import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'state/current_geolocator_position.dart';

/// 位置情報サービスプロバイダー
final geolocatorServiceProvider = Provider(
  GeolocatorService.new,
);

/// 位置情報サービス
class GeolocatorService {
  const GeolocatorService(this.ref);

  final Ref ref;

  /// 地図上の2つの位置(緯度経度)から距離(km)を求める
  /// 少数３位を四捨五入して少数第２位まで表示
  double? distanceBetween({
    required double latitude,
    required double longitude,
  }) {
    final currentPosition = ref.read(currentGeolocatorPositionProvider).value;
    if (currentPosition == null) {
      // 位置情報取得が端末に許可されていないため、距離を求めることは不可
      return null;
    }

    double toRadians(double degree) => degree * math.pi / 180;
    const r = 6378137; // 地球の半径
    final f1 = toRadians(latitude);
    final f2 = toRadians(currentPosition.latitude);
    final l1 = toRadians(longitude);
    final l2 = toRadians(currentPosition.longitude);
    final a = math.pow(math.sin((f2 - f1) / 2), 2);
    final b =
        math.cos(f1) * math.cos(f2) * math.pow(math.sin((l2 - l1) / 2), 2);
    final d = 2 * r * math.asin(math.sqrt(a + b));
    final result = d / 1000;
    return double.parse(result.toStringAsFixed(2));
  }
}
