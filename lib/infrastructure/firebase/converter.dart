import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/value_object/geo_location.dart';

/// 日時コンバーター
class TimestampConverter implements JsonConverter<DateTime, Object> {
  const TimestampConverter();

  @override
  DateTime fromJson(Object fieldValue) {
    return (fieldValue as Timestamp).toDate();
  }

  @override
  Object toJson(DateTime dateTime) {
    // json に変換するときは dateTime がなんであろうとサーバーのタイムスタンプで更新する
    // もし任意の日時を扱いたいときは別のコンバーターを用意する必要がある
    return FieldValue.serverTimestamp();
  }
}

/// 緯度経度コンバーター
class GeoPointConverter implements JsonConverter<GeoLocation, Object> {
  const GeoPointConverter();

  @override
  GeoLocation fromJson(Object fieldValue) {
    return (fieldValue as GeoPoint).toGeoLocation();
  }

  @override
  Object toJson(GeoLocation geoLocation) {
    return GeoPoint(geoLocation.latitude, geoLocation.longitude);
  }
}

extension _GeoPointEx on GeoPoint {
  /// GeoPoint => GeoLocation
  GeoLocation toGeoLocation() => GeoLocation(
        latitude: latitude,
        longitude: longitude,
      );
}
