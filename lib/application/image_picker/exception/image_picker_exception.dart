import '../../../domain/exceptions.dart';

/// 画像取得例外
class ImagePickerException extends DomainException {
  const ImagePickerException._({
    required this.code,
  }) : super('ImagePicker exception');

  factory ImagePickerException.failedCamera() => const ImagePickerException._(
        code: ImagePickerExceptionCode.failedCamera,
      );
  factory ImagePickerException.failedGallery() => const ImagePickerException._(
        code: ImagePickerExceptionCode.failedGallery,
      );

  /// エラーコード
  final ImagePickerExceptionCode code;

  @override
  String toString() => 'ImagePickerException: $message, '
      'code = ${code.name}';
}

/// 画像取得例外のエラーコード
enum ImagePickerExceptionCode {
  failedCamera,
  failedGallery,
  ;
}
