import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import '../../../domain/entity/value_object/geo_location.dart';
import '../../../util/logger.dart';

/// 使用端末の現在の位置情報(緯度・経度)を返す
/// 位置情報サービスが有効でない場合、または許可されていない場合エラーとなる
final currentUserLocationProvider = FutureProvider(
  (ref) async {
    // 位置情報サービスが有効かどうか確認する
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // 位置情報サービスが有効でない場合、続行不可
      return null;
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // ユーザーに位置情報を許可してもらうよう促す
      permission = await Geolocator.requestPermission();
    }

    logger.i('LocationPermission = ${permission.name}');
    switch (permission) {
      case LocationPermission.denied:
      case LocationPermission.deniedForever:
        return null;

      case LocationPermission.whileInUse:
      case LocationPermission.always:
      case LocationPermission.unableToDetermine:
        // 位置情報に対しての権限が許可されているということなのでデバイスの位置情報を返す
        final position = await Geolocator.getCurrentPosition();
        return position.toGeoLocation();
    }
  },
);

extension _PositionEx on Position {
  /// Position => GeoLocation
  GeoLocation toGeoLocation() => GeoLocation(
        latitude: latitude,
        longitude: longitude,
      );
}
