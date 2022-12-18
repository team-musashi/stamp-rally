import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repository/stamp_rally/entity/upload_image.dart';
import '../../domain/repository/stamp_rally/stamp_rally_repository.dart';
import '../../infrastructure/firebase/firebase.dart';
import '../../util/logger.dart';
import 'state/current_entry_stamp_rally.dart';

final uploadImageServiceProvider = Provider(
  UploadImageService.new,
);

class UploadImageService {
  const UploadImageService(this.ref);

  final Ref ref;

  Future<void> uploadImage({
    required String path,
    required String spotId,
  }) async {
    /// 現在参加しているスタンプラリーを取得する
    final stamprally = await ref.watch(currentEntryStampRallyProvider.future);
    final stamprallyId = stamprally!.id;
    logger.i('stamprallyId: $stamprallyId');

    /// uid を取得する
    /// なぜか動かない → 下記はuser情報を取得するプロバイダではない？
    /// final user = await ref.watch(userProvider.future);
    /// final uid = user.id;
    /// logger.i('user: $user');
    /// todo: 直接FirebaseAuthインスタンスを使ってしまっているので、アーキテクチャに則って動くようにする
    final auth = ref.watch(firebaseAuthProvider);
    final uid = auth.currentUser!.uid;
    logger.i('uid: $uid');

    /// アップロードパスを生成する
    final name = 'user/$uid/stamprally/$stamprallyId/spot/$spotId.jpg';
    logger.i('name: $name');

    /// UploadImage を生成する
    final uploadImage = UploadImage(path: path, storagePath: name);
    logger.i('uploadImage: $uploadImage');

    await ref.read(uploadImageProviderFamily(uploadImage).future);
  }
}
