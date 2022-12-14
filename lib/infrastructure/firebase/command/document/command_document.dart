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
  factory CommandDocument.enterStampRally({
    required String? uid,
    required String stampRallyId,
  }) {
    return CommandDocument(
      uid: uid ?? '',
      commandType: CommandType.enterStampRally.name,
      data: <String, dynamic>{'stampRallyId': stampRallyId},
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  /// 参加キャンセルコマンド
  factory CommandDocument.withdrawStampRally({
    required String? uid,
    required String stampRallyId,
  }) {
    return CommandDocument(
      uid: uid ?? '',
      commandType: CommandType.withdrawStampRally.name,
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
  enterStampRally,

  /// スタンプラリーへの参加をキャンセルする
  withdrawStampRally,

  /// スタンプラリーへの参加を完了する
  completeStampRally,
  ;
}
