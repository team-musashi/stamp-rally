import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../../../domain/repository/stamp_rally/stamp_rally_repository.dart';
import '../../../component/async_value_handler.dart';

/// 参加中画面
class EntryView extends ConsumerWidget {
  const EntryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueHandler<List<StampRally>>(
      value: ref.watch(entryStampRalliesProvider),
      builder: (stampRallies) {
        if (stampRallies.isEmpty) {
          return const Text('参加中のスタンプラリーはありません');
        } else {
          final stampRally = stampRallies[0];
          return Text(stampRally.title); // ToDo Figmaにあわせてデザイン実装
        }
      },
    );
  }
}
