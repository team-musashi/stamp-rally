import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../util/logger.dart';

/// 画像取得サービスプロバイダー
final imagePickerServiceProvider = Provider(
  ImagePickerService.new,
);

/// 画像取得サービス
class ImagePickerService {
  const ImagePickerService(this.ref);

  final Ref ref;

  /// カメラから画像を取得する
  Future<XFile?> pickImageByCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      return pickedImage;
    } else {
      logger.e('カメラからの画像の取得に失敗しました。');
      return null;
    }
  }

  /// ギャラリーから画像を取得する
  Future<XFile?> pickImageByGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      return pickedImage;
    } else {
      logger.e('ギャラリーからの画像の取得に失敗しました。');
      return null;
    }
  }
}
