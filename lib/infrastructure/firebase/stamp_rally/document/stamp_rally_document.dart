import 'package:freezed_annotation/freezed_annotation.dart';

import '../../converter.dart';

part 'stamp_rally_document.freezed.dart';
part 'stamp_rally_document.g.dart';

/// Firestore の公開中スタンプラリードキュメント
@freezed
class StampRallyDocument with _$StampRallyDocument {
  const factory StampRallyDocument({
    required String title,
    required String explanation,
    required String place,
    required int requiredTime,
    required String imageUrl,
    @ClientTimestampConverter() required DateTime startDate,
    @ClientTimestampConverter() DateTime? endDate,
  }) = _StampRallyDocument;

  const StampRallyDocument._();

  factory StampRallyDocument.fromJson(Map<String, dynamic> json) =>
      _$StampRallyDocumentFromJson(json);
}
