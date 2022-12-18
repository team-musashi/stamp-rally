import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../../../domain/repository/stamp_rally/stamp_rally_repository.dart';
import '../../../../util/date_time_extension.dart';
import '../../../component/async_value_handler.dart';
import '../../../router.dart';
import 'stamp_rally.dart';

/// 完了済画面
class CompleteView extends ConsumerWidget {
  const CompleteView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueHandler<List<StampRally>>(
      value: ref.watch(completeStampRalliesProvider),
      builder: (stampRallies) {
        return GridView.builder(
          padding: const EdgeInsets.all(4),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: stampRallies.length,
          itemBuilder: (context, index) {
            final stampRally = stampRallies[index];
            return InkWell(
              onTap: () {
                CompleteStampRallyViewRoute.fromStampRally(stampRally)
                    .go(context);
              },
              child: StampRallyThumbnail(
                stampRally: stampRally,
                labelWidget: _CompletedDateLabel(
                  date: stampRally.updatedAt?.toFormatString() ?? '日付不明',
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _CompletedDateLabel extends StatelessWidget {
  const _CompletedDateLabel({
    required this.date,
  });

  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Text(
          date,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      ),
    );
  }
}
