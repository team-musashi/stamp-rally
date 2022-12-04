import 'package:freezed_annotation/freezed_annotation.dart';

import 'spot.dart';

part 'stamp_rally.freezed.dart';

/// スタンプラリー
@freezed
class StampRally with _$StampRally {
  const factory StampRally({
    /// ID
    required String id,

    /// スタンプラリー名称
    required String title,

    /// スタンプラリーの詳細説明
    required String explanation,

    /// 開催場所
    required String place,

    /// 所用時間
    required int requiredTime,

    /// 画像URL
    required String imageUrl,

    /// 開催開始日
    required DateTime startDate,

    /// 開催終了日
    DateTime? endDate,

    /// 作成日時
    DateTime? createdAt,

    /// 更新日時
    DateTime? updatedAt,

    /// スタンプラリーのスポットのリスト
    @Default(<Spot>[]) List<Spot> spots,

    /// スタンプラリーの種類（公開中／参加中）
    required StampRallyType type,
  }) = _StampRally;
}

enum StampRallyType {
  public,
  entry,
}
