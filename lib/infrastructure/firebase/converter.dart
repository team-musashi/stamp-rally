import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// サーバー日時コンバーター
class ServerTimestampConverter implements JsonConverter<DateTime?, Object?> {
  const ServerTimestampConverter();

  @override
  DateTime? fromJson(Object? fieldValue) {
    return (fieldValue as Timestamp?)?.toDate();
  }

  @override
  Object? toJson(DateTime? dateTime) {
    // dateTime がなんであろうとサーバーのタイムスタンプで更新する
    return dateTime != null ? FieldValue.serverTimestamp() : null;
  }
}

/// クライアント日時コンバーター
class ClientTimestampConverter implements JsonConverter<DateTime?, Object?> {
  const ClientTimestampConverter();

  @override
  DateTime? fromJson(Object? fieldValue) {
    return (fieldValue as Timestamp?)?.toDate();
  }

  @override
  Object? toJson(DateTime? dateTime) {
    return dateTime != null ? Timestamp.fromDate(dateTime) : null;
  }
}
