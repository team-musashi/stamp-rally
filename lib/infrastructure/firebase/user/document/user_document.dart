import 'package:freezed_annotation/freezed_annotation.dart';

import '../../converter.dart';

part 'user_document.freezed.dart';
part 'user_document.g.dart';

@freezed
class UserDocument with _$UserDocument {
  const factory UserDocument({
    String? provider,
    String? createdPlatform,
    @ServerTimestampConverter() DateTime? createdAt,
    @ServerTimestampConverter() DateTime? updatedAt,
  }) = _UserDocument;

  const UserDocument._();

  factory UserDocument.fromJson(Map<String, dynamic> json) =>
      _$UserDocumentFromJson(json);
}
