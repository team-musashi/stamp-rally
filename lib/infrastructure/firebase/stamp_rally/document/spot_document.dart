import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entity/value_object/geo_location.dart';
import '../../../../domain/repository/stamp_rally/entity/spot.dart';
import '../../converter.dart';

part 'spot_document.freezed.dart';
part 'spot_document.g.dart';

/// Firestore の公開中スタンプラリードキュメント
@freezed
class SpotDocument with _$SpotDocument {
  const factory SpotDocument({
    required String title,
    required String explanation,
    required int order,
    required String imageUrl,
    @GeoPointConverter() GeoLocation? location,
    @TimestampConverter() DateTime? gotDate,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
  }) = _SpotDocument;

  const SpotDocument._();

  factory SpotDocument.fromJson(Map<String, dynamic> json) =>
      _$SpotDocumentFromJson(json);

  static _SpotDocumentField get field => _SpotDocumentField();

  /// SpotDocument -> Spot
  Spot toSpot({required String docId}) {
    return Spot(
      id: docId,
      title: title,
      explanation: explanation,
      imageUrl: imageUrl,
      location: location!,
      order: order,
      gotDate: gotDate,
    );
  }
}

class _SpotDocumentField {
  String get title => 'title';
  String get explanation => 'explanation';
  String get order => 'order';
}
