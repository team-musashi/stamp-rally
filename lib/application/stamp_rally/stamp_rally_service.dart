import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repository/command/command_repository.dart';
import '../../domain/repository/stamp_rally/entity/upload_image.dart';
import '../../domain/repository/stamp_rally/stamp_rally_repository.dart';
import '../../util/logger.dart';
import 'state/complete_stamp_rally_result.dart';
import 'state/enter_stamp_rally_result.dart';
import 'state/uplode_image_result.dart';
import 'state/withdraw_stamp_rally_result.dart';

/// スタンプラリーサービスプロバイダー
final stampRallyServiceProvider = Provider(
  StampRallyService.new,
);

/// スタンプラリーサービス
///
/// スタンプラリーに関する操作を提供する
/// Widget から呼ばれ、各 Repository や State を操作するロジックを実装する
class StampRallyService {
  const StampRallyService(this.ref);
  final Ref ref;

  /// スタンプラリーに参加する
  Future<void> enterStampRally({required String stampRallyId}) async {
    final notifier = ref.read(enterStampRallyResultProvider.notifier);
    notifier.state = const AsyncValue.loading();
    notifier.state = await AsyncValue.guard(() async {
      await ref.read(commandRepositoryProvider).enterStampRally(
            publicStampRallyId: stampRallyId,
          );

      // 参加スタンプラリーに追加されるのを待つ
      final entryStampRally =
          await ref.refresh(entryStampRallyStreamProvider.future);
      logger.i('Added entryStampRally: id = ${entryStampRally?.id}');
      return entryStampRally;
    });
  }

  /// 参加中スタンプラリーを中断する
  Future<void> withdrawStampRally({required String stampRallyId}) async {
    final notifier = ref.read(withdrawStampRallyResultProvider.notifier);
    notifier.state = const AsyncValue.loading();
    notifier.state = await AsyncValue.guard(() async {
      await ref
          .read(commandRepositoryProvider)
          .withdrawStampRally(entryStampRallyId: stampRallyId);

      // 参加中スタンプラリーが中断されるのを待つ
      final entryStampRally =
          await ref.refresh(entryStampRallyStreamProvider.future);
      assert(entryStampRally == null);
      logger.i('withdrawn entryStampRally: id = $stampRallyId');
    });
  }

  /// 参加中スタンプラリーを完了する
  Future<void> completeStampRally({required String stampRallyId}) async {
    final notifier = ref.read(completeStampRallyResultProvider.notifier);
    notifier.state = const AsyncValue.loading();
    notifier.state = await AsyncValue.guard(() async {
      await ref
          .read(commandRepositoryProvider)
          .completeStampRally(entryStampRallyId: stampRallyId);

      // 参加中スタンプラリーが更新されるのを待つ
      final entryStampRally =
          await ref.refresh(entryStampRallyStreamProvider.future);
      assert(entryStampRally == null);
      logger.i('completed entryStampRally: id = $stampRallyId');
    });
  }

  /// 画像をアップロードする
  Future<String?> uploadImage({required UploadImage uploadImage}) async {
    final url =
        await ref.read(uploadImageFutureProviderFamily(uploadImage).future);
    if (url != null) {
      logger.i(url);
      // todo: URL を entrySpot のフィールドに追加する、 gotDate を現在時刻で更新する
      // final notifier = ref.read(uploadImageResultFutureProviderFamily.notifier);
      // notifier.state = const AsyncValue.loading();
      // notifier.state = await AsyncValue.guard(() async {
      //   return null;
      // });
      ref.read(uploadImageResultProvider.notifier).state = url;
      return url;
    }
    return null;
  }
}
