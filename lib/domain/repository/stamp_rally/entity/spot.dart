import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'spot.freezed.dart';

/// 場所
@freezed
class Spot with _$Spot {
  const factory Spot({
    /// ドキュメントID
    required String id,

    /// 場所を回る順番
    required int title,

    /// 画像URL
    required String imageUrl,

    /// 開催開始日
    required GeoPoint point,

    /// スタンプ取得日
    DateTime? gotDate,
  }) = _Spot;
}
