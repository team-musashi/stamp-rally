import 'package:freezed_annotation/freezed_annotation.dart';

import '../../converter.dart';

part 'command_document.freezed.dart';
part 'command_document.g.dart';

/// Firestore のコマンドドキュメント
@freezed
class CommandDocument with _$CommandDocument {
  factory CommandDocument({
    required String uid,
    required String commandType,
    required Map<String, dynamic> data,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
  }) = _CommandDocument;
  factory CommandDocument.fromJson(Map<String, dynamic> json) =>
      _$CommandDocumentFromJson(json);

  /// 参加コマンド
  factory CommandDocument.entryStampRally({
    required String? uid,
    required String stampRallyId,
  }) {
    return CommandDocument(
      uid: uid ?? '',
      commandType: CommandType.entryStampRally.name,
      data: <String, dynamic>{'stampRallyId': stampRallyId},
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  /// 参加キャンセルコマンド
  factory CommandDocument.withdrawalStampRally({
    required String? uid,
    required String stampRallyId,
  }) {
    return CommandDocument(
      uid: uid ?? '',
      commandType: CommandType.withdrawalStampRally.name,
      data: <String, dynamic>{'stampRallyId': stampRallyId},
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  /// 参加完了コマンド
  factory CommandDocument.completeStampRally({
    required String? uid,
    required String stampRallyId,
  }) {
    return CommandDocument(
      uid: uid ?? '',
      commandType: CommandType.completeStampRally.name,
      data: <String, dynamic>{'stampRallyId': stampRallyId},
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
}

/// コマンドタイプ
enum CommandType {
  /// スタンプラリーに参加する
  entryStampRally,

  /// スタンプラリーへの参加をキャンセルする
  withdrawalStampRally,

  /// スタンプラリーへの参加を完了する
  completeStampRally,
  ;
}
