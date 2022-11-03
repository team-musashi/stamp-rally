import 'package:flutter/material.dart';

import 'component/error_view.dart';

/// エラー画面
class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    this.error,
  });

  final Object? error;

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
