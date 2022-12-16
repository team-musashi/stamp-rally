import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repository/command/command_repository.dart';
import '../../domain/repository/stamp_rally/stamp_rally_repository.dart';
import '../../util/logger.dart';
import 'state/complete_stamp_rally_result.dart';
import 'state/enter_stamp_rally_result.dart';
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
      // あとで加算されるのを確認するために、現時点の完了済スタンプラリーのリストを取得する
      final beforeCompleteStampRallies =
          await ref.read(completeStampRalliesProvider.future);

      await ref
          .read(commandRepositoryProvider)
          .completeStampRally(entryStampRallyId: stampRallyId);

      // 参加完了済スタンプラリーリストが更新されるのを待つ
      final completeStampRallies =
          await ref.refresh(completeStampRalliesStreamProvider.future);
      assert(
        completeStampRallies.length == beforeCompleteStampRallies.length + 1,
      );
      logger.i('completed entryStampRally: id = $stampRallyId');
      return completeStampRallies
          .firstWhere((stampRally) => stampRally.id == stampRallyId);
    });
  }
}
