import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import '../../util/logger.dart';

/// 使用端末の現在の位置情報(緯度・経度)
final currentPositionProvider = Provider<Position?>(
  (ref) => null,
);

/// 位置情報サービスプロバイダー
final geolocatorServiceProvider = Provider(
  GeolocatorService.new,
);

/// 位置情報サービス
class GeolocatorService {
  const GeolocatorService(this.ref);

  final Ref ref;

  /// デバイスの現在位置を決定する
  /// 位置情報サービスが有効でない場合、または許可されていない場合エラーを返す
  Future<void> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // 位置情報サービスが有効かどうかをテストする
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // 位置情報サービスが有効でない場合、続行不可
      logger.e('位置情報サービスは無効です。');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // ユーザーに位置情報を許可してもらうよう促す
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        logger.e('位置情報サービスが拒否されました。');
        return;
      }
    }

    // 永久に拒否されている場合のエラーを返す
    if (permission == LocationPermission.deniedForever) {
      logger.e('位置情報サービスが拒否されています。');
      return;
    }

    // ここまでたどり着けば、位置情報に対しての権限が許可されているということなので
    // デバイスの位置情報を返す。
    final currentLocation = await Geolocator.getCurrentPosition();
    currentPositionProvider.overrideWithValue(currentLocation);
  }
}
