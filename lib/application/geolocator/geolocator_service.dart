import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import '../../util/logger.dart';

/// 使用端末の現在の位置情報(緯度・経度)
Position? currentPosition;

/// 位置情報サービスプロバイダー
final geolocatorServiceProvider = Provider(
  GeolocatorService.new,
);

/// 位置情報サービス
class GeolocatorService {
  const GeolocatorService(this.ref);

  final Ref ref;

  /// デバイスの現在位置を決定する
  /// 位置情報サービスが有効でない場合、または許可されていない場合エラーとなる
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
    // デバイスの位置情報を保持する。
    currentPosition = await Geolocator.getCurrentPosition();
  }

  /// 地図上の2つの位置(緯度経度)から距離(km)を求める
  /// 少数３位を四捨五入して少数第２位まで表示
  double? distanceBetween({
    required double latitude,
    required double longitude,
  }) {
    if (currentPosition == null) {
      // 位置情報取得が端末に許可されていないため、距離を求めることは不可
      return null;
    }

    double toRadians(double degree) => degree * math.pi / 180;
    const r = 6378137; // 地球の半径
    final f1 = toRadians(latitude);
    final f2 = toRadians(currentPosition!.latitude);
    final l1 = toRadians(longitude);
    final l2 = toRadians(currentPosition!.longitude);
    final a = math.pow(math.sin((f2 - f1) / 2), 2);
    final b =
        math.cos(f1) * math.cos(f2) * math.pow(math.sin((l2 - l1) / 2), 2);
    final d = 2 * r * math.asin(math.sqrt(a + b));
    final result = d / 1000;
    return double.parse(result.toStringAsFixed(2));
  }

  Position? get getCurrentPosition => currentPosition;
}
