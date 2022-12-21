import 'dart:math' as math;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'geo_location.freezed.dart';

/// 緯度経度
@freezed
class GeoLocation with _$GeoLocation {
  const factory GeoLocation({
    /// 緯度
    @Default(0) double latitude,

    /// 経度
    @Default(0) double longitude,
  }) = _GeoLocation;
  const GeoLocation._();

  /// 2点間の距離(km)を求める
  /// 少数３位を四捨五入して少数第２位まで表示
  double distance(GeoLocation other) {
    double toRadians(double degree) => degree * math.pi / 180;
    const r = 6378137; // 地球の半径
    final f1 = toRadians(latitude);
    final f2 = toRadians(other.latitude);
    final l1 = toRadians(longitude);
    final l2 = toRadians(other.longitude);
    final a = math.pow(math.sin((f2 - f1) / 2), 2);
    final b =
        math.cos(f1) * math.cos(f2) * math.pow(math.sin((l2 - l1) / 2), 2);
    final d = 2 * r * math.asin(math.sqrt(a + b));
    final result = d / 1000;
    return double.parse(result.toStringAsFixed(2));
  }
}
