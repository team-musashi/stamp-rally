import 'dart:math' as math;

/// スタンプラリーアプリで汎用的に使用可能なメソッド群
class StampRallyUtil {
  StampRallyUtil._();
  static final instance = StampRallyUtil._();

  /// 地図上の2つの位置(緯度経度)から距離(km)を求める
  /// 少数３位を四捨五入して少数第２位まで表示
  double distanceBetween({
    required double latitude1,
    required double longitude1,
    required double latitude2,
    required double longitude2,
  }) {
    double toRadians(double degree) => degree * math.pi / 180;
    const r = 6378137; // 地球の半径
    final f1 = toRadians(latitude1);
    final f2 = toRadians(latitude2);
    final l1 = toRadians(longitude1);
    final l2 = toRadians(longitude2);
    final a = math.pow(math.sin((f2 - f1) / 2), 2);
    final b =
        math.cos(f1) * math.cos(f2) * math.pow(math.sin((l2 - l1) / 2), 2);
    final d = 2 * r * math.asin(math.sqrt(a + b));
    return double.parse(d.toStringAsFixed(2));
  }
}
