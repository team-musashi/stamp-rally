import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_image.freezed.dart';

@freezed
class UploadImage with _$UploadImage {
  const factory UploadImage({
    /// アップロードする画像のパス
    required String path,

    /// アップロード先の Storage のパス
    required String storagePath,
  }) = _UploadImage;
}
