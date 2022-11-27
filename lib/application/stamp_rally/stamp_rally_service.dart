import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repository/stamp_rally/stamp_rally_repository.dart';
import 'state/entry_stamp_rally_result.dart';

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
  Future<void> entryStampRally({required String stampRallyId}) async {
    final notifier = ref.read(entryStampRallyResultProvider.notifier);
    notifier.state = const AsyncValue.loading();
    notifier.state = await AsyncValue.guard(() async {
      await ref.read(stampRallyRepositoryProvider).entryStampRally(
            stampRallyId: stampRallyId,
          );
    });
  }
}
