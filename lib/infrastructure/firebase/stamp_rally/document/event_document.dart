import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_document.freezed.dart';
part 'event_document.g.dart';

/// Firestore のイベントドキュメント
@freezed
class EventDocument with _$EventDocument {
  factory EventDocument({
    required String eventType,
    required Map<String, dynamic> data,
    required DateTime createdAt,
  }) = _EventDocument;
  factory EventDocument.fromJson(Map<String, dynamic> json) =>
      _$EventDocumentFromJson(json);

  /// 参加イベント
  factory EventDocument.entryStampRally({required String stampRallyId}) {
    return EventDocument(
      eventType: EventEnum.entryStampRally.name,
      data: <String, dynamic>{'stampRallyId': stampRallyId},
      createdAt: DateTime.now(),
    );
  }

  /// 参加キャンセルイベント
  factory EventDocument.leaveStampRally({required String stampRallyId}) {
    return EventDocument(
      eventType: EventEnum.leaveStampRally.name,
      data: <String, dynamic>{'stampRallyId': stampRallyId},
      createdAt: DateTime.now(),
    );
  }

  static _EventDocumentField get field => _EventDocumentField();
}

class _EventDocumentField {
  String get eventType => 'eventType';
  String get data => 'data';
  String get createdAt => 'createdAt';
}

enum EventEnum { entryStampRally, leaveStampRally }
