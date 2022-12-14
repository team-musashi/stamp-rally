import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../util/logger.dart';
import 'state/image_picker_result.dart';

/// 画像取得サービスプロバイダー
final imagePickerServiceProvider = Provider(
  ImagePickerService.new,
);

/// 画像取得サービス
class ImagePickerService {
  const ImagePickerService(this.ref);

  final Ref ref;

  /// カメラから画像を取得する
  Future<void> pickImageByCamera() async {
    final picker = ImagePicker();
    final notifier = ref.read(imagePickerResultProvider.notifier);
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      notifier.state = File(pickedImage.path);
    } else {
      logger.e('カメラからの画像の取得に失敗しました。');
    }
  }

  /// ギャラリーから画像を取得する
  Future<void> pickImageByGallery() async {
    final picker = ImagePicker();
    final notifier = ref.read(imagePickerResultProvider.notifier);
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      notifier.state = File(pickedImage.path);
    } else {
      logger.e('ギャラリーからの画像の取得に失敗しました。');
    }
  }
}
