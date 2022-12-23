import 'package:freezed_annotation/freezed_annotation.dart';

import '../../converter.dart';

part 'user_document.freezed.dart';
part 'user_document.g.dart';

/// Firestore のユーザードキュメント
@freezed
class UserDocument with _$UserDocument {
  const factory UserDocument({
    String? authProvider,
    String? platform,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
  }) = _UserDocument;

  const UserDocument._();

  factory UserDocument.fromJson(Map<String, dynamic> json) =>
      _$UserDocumentFromJson(json);
}
