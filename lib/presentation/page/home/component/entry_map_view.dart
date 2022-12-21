import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/stamp_rally/state/current_entry_stamp_rally.dart';
import '../../../component/async_value_handler.dart';
import '../../stamp_rally/component/stamp_rally_map_view.dart';

/// 参加中スタンプラリーのスポットマップ表示用View
class EntryMapView extends ConsumerWidget {
  const EntryMapView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueHandler(
      value: ref.watch(currentEntryStampRallyProvider),
      builder: (stampRally) {
        return StampRallyMapView(
          stampRally: stampRally,
        );
      },
    );
  }
}
