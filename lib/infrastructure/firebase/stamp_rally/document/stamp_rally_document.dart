import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entity/value_object/geo_location.dart';
import '../../converter.dart';

part 'stamp_rally_document.freezed.dart';
part 'stamp_rally_document.g.dart';

/// Firestore の公開中スタンプラリードキュメント
@freezed
class StampRallyDocument with _$StampRallyDocument {
  const factory StampRallyDocument({
    required String title,
    required String summary,
    required String area,
    required int requiredTime,
    required String imageUrl,
    String? status,
    @GeoPointConverter() List<GeoLocation>? route,
    @TimestampConverter() required DateTime startDate,
    @TimestampConverter() DateTime? endDate,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
  }) = _StampRallyDocument;

  const StampRallyDocument._();

  factory StampRallyDocument.fromJson(Map<String, dynamic> json) =>
      _$StampRallyDocumentFromJson(json);

  static _StampRallyDocumentField get field => _StampRallyDocumentField();
}

class _StampRallyDocumentField {
  String get status => 'status';
  String get startDate => 'startDate';
  String get createdAt => 'createdAt';
}
