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
}
