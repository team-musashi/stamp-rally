import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'exception/image_picker_exception.dart';
import 'state/image_picker_result.dart';
import 'state/picked_image.dart';

/// ImagePicker
final imagePickerProvider = Provider(
  (_) => ImagePicker(),
);

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
    final notifier = ref.read(imagePickerResultProvider.notifier);
    notifier.state = const AsyncValue.loading();
    notifier.state = await AsyncValue.guard(() async {
      final picker = ref.read(imagePickerProvider);
      final pickedImage = await picker.pickImage(source: ImageSource.camera);
      if (pickedImage == null) {
        throw ImagePickerException.failedCamera();
      }
      // 取得した画像を更新する
      ref.read(pickedImageProvider.notifier).state = File(pickedImage.path);
    });
  }

  /// ギャラリーから画像を取得する
  Future<void> pickImageByGallery() async {
    final notifier = ref.read(imagePickerResultProvider.notifier);
    notifier.state = const AsyncValue.loading();
    notifier.state = await AsyncValue.guard(() async {
      final picker = ref.read(imagePickerProvider);
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage == null) {
        throw ImagePickerException.failedGallery();
      }
      // 取得した画像を更新する
      ref.read(pickedImageProvider.notifier).state = File(pickedImage.path);
    });
  }
}
