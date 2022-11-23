import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repository/stamp_rally/entity/stamp_rally.dart';

/// スタンプラリー詳細画面
class StampRallyExplanationPage extends ConsumerWidget {
  const StampRallyExplanationPage({required this.stampRally, super.key});
  final StampRally stampRally;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('スタンプラリー詳細')),
      body: Text(stampRally.title),
    );
  }
}
