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
    required int order,
    required String title,
    required String summary,
    String? address,
    String? tel,
    required String imageUrl,
    @GeoPointConverter() GeoLocation? location,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
    String? uploadImagePath,
    @TimestampConverter() DateTime? gotDate,
  }) = _SpotDocument;

  const SpotDocument._();

  factory SpotDocument.fromJson(Map<String, dynamic> json) =>
      _$SpotDocumentFromJson(json);

  static _SpotDocumentField get field => _SpotDocumentField();

  /// SpotDocument -> Spot
  Spot toSpot({
    required String id,
    required String stampRallyId,
    required bool isEntry,
    String? uploadImageUrl,
  }) {
    return Spot(
      id: id,
      stampRallyId: stampRallyId,
      isEntry: isEntry,
      order: order,
      title: title,
      summary: summary,
      address: address,
      tel: tel,
      imageUrl: imageUrl,
      location: location ?? const GeoLocation(),
      gotDate: gotDate,
      uploadImageUrl: uploadImageUrl,
    );
  }
}

class _SpotDocumentField {
  String get order => 'order';
  String get uploadImagePath => 'uploadImagePath';
  String get gotDate => 'gotDate';
}
