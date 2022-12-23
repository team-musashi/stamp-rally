import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/repository/stamp_rally/entity/spot.dart';

part 'spot_param.freezed.dart';

/// スポットパラメータ
@freezed
class SpotParam with _$SpotParam {
  const factory SpotParam({
    /// スポットID
    required String spotId,

    /// エンティティのキャッシュ
    Spot? cache,
  }) = _SpotParam;
}
