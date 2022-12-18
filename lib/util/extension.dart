import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

extension AsyncValueEx<T> on AsyncValue<T> {
  /// エラーのみ処理する
  void whenError(
    void Function(Object error, StackTrace? stackTrace) error,
  ) {
    if (isLoading) {
      return;
    }
    return map<void>(
      data: (_) {},
      error: (e) => error(e.error, e.stackTrace),
      loading: (_) {},
    );
  }
}

extension DateTimeExtension on DateTime {
  String toFormatString({String format = 'yyyy/MM/dd'}) {
    final formatter = DateFormat(format, 'ja_JP');
    return formatter.format(this);
  }
}
