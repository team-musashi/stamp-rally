import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../converter.dart';

part 'spot_document.freezed.dart';
part 'spot_document.g.dart';

/// Firestore の公開中スタンプラリードキュメント
@freezed
class SpotDocument with _$SpotDocument {
  const factory SpotDocument({
    required int order,
    required String imageUrl,
    @GeoPointConverter() required GeoPoint point,
    @ServerTimestampConverter() DateTime? gotDate,
  }) = _SpotDocument;

  const SpotDocument._();

  factory SpotDocument.fromJson(Map<String, dynamic> json) =>
      _$SpotDocumentFromJson(json);
}
