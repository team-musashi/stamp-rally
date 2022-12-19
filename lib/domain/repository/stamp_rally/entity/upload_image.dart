import 'package:freezed_annotation/freezed_annotation.dart';
import 'spot.dart';

import 'stamp_rally.dart';

part 'upload_image.freezed.dart';

@freezed
class UploadImage with _$UploadImage {
  const factory UploadImage({
    /// アップロードする画像のパス
    required String path,

    /// Stamprally
    required StampRally stampRally,

    /// Spot
    required Spot spot,
  }) = _UploadImage;
}
