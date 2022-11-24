import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/repository/stamp_rally/entity/stamp_rally.dart';

part 'stamp_rally_param.freezed.dart';

/// スタンプラリーパラメータ
///
/// 一覧画面から詳細画面への遷移時に受け渡すときに使うデータ構造
/// 一意に識別できる識別子とエンティティ本体で構成される
/// Web で再読込した場合や DynamicLink による画面遷移時は cache は null になるので
/// その場合は識別子を使って取得し直すことを想定している
@freezed
class StampRallyParam with _$StampRallyParam {
  const factory StampRallyParam({
    /// スタンプラリーID
    required String stampRallyId,

    /// エンティティのキャッシュ
    StampRally? cache,
  }) = _StampRallyParam;
}
