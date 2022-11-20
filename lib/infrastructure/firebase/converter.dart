import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/value_object/geo_location.dart';

/// サーバー日時コンバーター
class ServerTimestampConverter implements JsonConverter<DateTime?, Object?> {
  const ServerTimestampConverter();

  @override
  DateTime? fromJson(Object? fieldValue) {
    return (fieldValue as Timestamp?)?.toDate();
  }

  @override
  Object? toJson(DateTime? dateTime) {
    // dateTime がなんであろうとサーバーのタイムスタンプで更新する
    return dateTime != null ? FieldValue.serverTimestamp() : null;
  }
}

/// クライアント日時コンバーター
class ClientTimestampConverter implements JsonConverter<DateTime, Object> {
  const ClientTimestampConverter();

  @override
  DateTime fromJson(Object fieldValue) {
    return (fieldValue as Timestamp).toDate();
  }

  @override
  Object toJson(DateTime dateTime) {
    return Timestamp.fromDate(dateTime);
  }
}

/// 緯度経度コンバーター
class GeoPointConverter implements JsonConverter<GeoLocation?, Object?> {
  const GeoPointConverter();

  @override
  GeoLocation? fromJson(Object? fieldValue) {
    return (fieldValue as GeoPoint?)?.toGeoLocation();
  }

  @override
  Object? toJson(GeoLocation? geoLocation) {
    return geoLocation != null
        ? GeoPoint(geoLocation.latitude, geoLocation.longitude)
        : null;
  }
}

extension _GeoPointEx on GeoPoint {
  /// GeoPoint => GeoLocation
  GeoLocation toGeoLocation() => GeoLocation(
        latitude: latitude,
        longitude: longitude,
      );
}
