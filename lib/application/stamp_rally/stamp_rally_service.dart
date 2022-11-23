import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../domain/repository/stamp_rally/spot_repository.dart';

/// スタンプラリーサービスプロバイダー
final stampRallyServiceProvider = Provider(
  StampRallyService.new,
);

/// fetchSpotsFromStampRallyProviderをコールするProvider
final fetchSpotsFromStampRallyProvider =
    FutureProvider.family<StampRally, StampRally>(
  (ref, stampRally) =>
      ref.read(stampRallyServiceProvider).fetchSpotsFromStampRally(stampRally),
);

/// スタンプラリーサービス
///
/// スタンプラリーに関する操作を提供する
/// Widget から呼ばれ、各 Repository や State を操作するロジックを実装する
class StampRallyService {
  const StampRallyService(this.ref);
  final Ref ref;

  /// スタンプラリー情報を元に紐づくスポット情報を取得
  /// 取得したスポットをスタンプラリー情報にぶら下げて返却
  Future<StampRally> fetchSpotsFromStampRally(StampRally stampRally) async {
    final spots = await ref
        .read(spotRepositoryProvider)
        .fetchSpots(stampRallyId: stampRally.id);
    return stampRally.copyWith(spots: spots);
  }
}
