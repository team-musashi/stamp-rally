import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../entity/value_object/geo_location.dart';

part 'spot.freezed.dart';

/// スタンプラリーの各スポット
@freezed
class Spot with _$Spot {
  const factory Spot({
    /// ID
    required String id,

    /// スポットの順番
    required int order,

    /// 画像URL
    required String imageUrl,

    /// 緯度経度
    required GeoLocation location,

    /// スタンプ取得日
    DateTime? gotDate,

    /// 作成日時
    DateTime? createdAt,

    /// 更新日時
    DateTime? updatedAt,
  }) = _Spot;
}
