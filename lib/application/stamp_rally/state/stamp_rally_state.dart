import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../../domain/repository/stamp_rally/stamp_rally_repository.dart';

part 'stamp_rally_state.freezed.dart';

/// 公開中スタンプラリー一覧状態プロバイダー
final publicStampRalllyStateProvider = StateNotifierProvider.autoDispose<
    StampRallyStateNotifier, AsyncValue<StampRallyState>>(
  (ref) => StampRallyStateNotifier(
    stampRallyRepository: ref.watch(stampRallyRepositoryProvider),
  ),
);

/// スタンプラリー一覧状態
@freezed
class StampRallyState with _$StampRallyState {
  const factory StampRallyState({
    @Default(<StampRally>[]) List<StampRally> items,
  }) = _StampRallyState;
}

/// スタンプラリー一覧状態Notifier
class StampRallyStateNotifier
    extends StateNotifier<AsyncValue<StampRallyState>> {
  StampRallyStateNotifier({
    required this.stampRallyRepository,
  }) : super(const AsyncValue.loading()) {
    state = const AsyncValue.data(StampRallyState());
    fetchAllPublicStampRally();
  }

  /// スタンプラリーリポジトリ
  final StampRallyRepository stampRallyRepository;

  /// 公開中スタンプラリーを全件取得する
  Future<void> fetchAllPublicStampRally() async {
    final value = state.value;
    if (value == null) {
      return;
    }

    state = await AsyncValue.guard(() async {
      late List<StampRally> items;
      stampRallyRepository
          .fetchAllPublicStampRally()
          .map((result) => items = result);
      return value.copyWith(items: items);
    });
  }
}
