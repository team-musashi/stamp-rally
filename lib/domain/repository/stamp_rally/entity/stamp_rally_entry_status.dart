import 'package:collection/collection.dart';

/// 参加ステータス
enum StampRallyEntryStatus {
  /// 参加中
  entry,

  /// 完了
  complete,

  /// 中断
  withdrawal,
  ;

  /// 文字列から StampRallyEntryStatus を返す
  /// 見つからない場合は null を返す
  static StampRallyEntryStatus? nameOf(String? name) =>
      StampRallyEntryStatus.values
          .firstWhereOrNull((status) => status.name == name);
}
