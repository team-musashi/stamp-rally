import 'package:freezed_annotation/freezed_annotation.dart';

import 'spot.dart';
import 'stamp_rally_entry_status.dart';

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

    /// 参加ステータス
    StampRallyEntryStatus? status,

    /// 開催開始日
    required DateTime startDate,

    /// 開催終了日
    DateTime? endDate,

    /// 参加可能かどうか
    @Default(true) bool canEntry,

    /// 作成日時
    DateTime? createdAt,

    /// 更新日時
    DateTime? updatedAt,

    /// スタンプラリーのスポットのリスト
    @Default(<Spot>[]) List<Spot> spots,
  }) = _StampRally;
  const StampRally._();
}
