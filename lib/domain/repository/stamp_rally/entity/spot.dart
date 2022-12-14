import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../entity/value_object/geo_location.dart';

part 'spot.freezed.dart';

/// スタンプラリーの各スポット
@freezed
class Spot with _$Spot {
  const factory Spot({
    /// ID
    required String id,

    /// スタンプラリーID
    required String stampRallyId,

    /// 参加スタンプラリーのスポットかどうか
    required bool isEntry,

    /// スポットの順番
    required int order,

    /// スポットの名前
    required String title,

    /// スポットの概要
    required String summary,

    /// スポットの住所
    String? address,

    /// スポットの電話番号
    String? tel,

    /// 画像URL
    required String imageUrl,

    /// 緯度経度
    required GeoLocation location,

    /// 作成日時
    DateTime? createdAt,

    /// 更新日時
    DateTime? updatedAt,

    /// アップロードしたスポット画像のURL
    String? uploadImageUrl,

    /// スタンプ取得日
    DateTime? gotDate,
  }) = _Spot;
  const Spot._();

  /// スタンプ押下済みかどうか
  bool get isStamped => gotDate != null;
}
