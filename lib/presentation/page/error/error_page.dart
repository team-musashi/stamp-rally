import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../domain/exceptions.dart';
import '../../../util/logger.dart';

/// エラー画面
class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    this.error,
  });

  /// 例外
  final Exception? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ErrorView(
          error: error ?? 'エラーが発生しました',
        ),
      ),
    );
  }
}

/// エラーView
///
/// エラーを画面上に表示する
class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
    required this.error,
    this.stackTrace,
  });

  final Object error;
  final StackTrace? stackTrace;

  @override
  Widget build(BuildContext context) {
    logger.e('An error has occurred.', error, stackTrace);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            error.errorMessage,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Gap(40),
        ],
      ),
    );
  }
}
