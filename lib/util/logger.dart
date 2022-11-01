import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roggle/roggle.dart';

const _loggerName = '[APP]';

final logger = Roggle(
  printer: SinglePrettyPrinter(
    loggerName: _loggerName,
    // error 以上のときはスタックトレースを出力する
    stackTraceLevel: Level.error,
    // iOS はカラー非対応
    colors: !Platform.isIOS,
    // ログが長くなるので非表示
    printCaller: false,
  ),
);

class ProviderLogger extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase<dynamic> provider,
    Object? value,
    ProviderContainer container,
  ) {
    final name = provider.name;
    if (name != null) {
      logger.v(
        '[RIVERPOD][ADD] $name: value = $value',
      );
    }
  }

  @override
  void providerDidFail(
    ProviderBase<dynamic> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    final name = provider.name;
    if (name != null) {
      logger.w(
        '[RIVERPOD][ERROR] $name',
        error,
        stackTrace,
      );
    }
  }

  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    final name = provider.name;
    if (name != null) {
      logger.v(
        '[RIVERPOD][UPDATE] $name: '
        'newValue = $newValue',
      );
    }
  }

  @override
  void didDisposeProvider(
    ProviderBase<dynamic> provider,
    ProviderContainer container,
  ) {
    final name = provider.name;
    if (name != null) {
      logger.v(
        '[RIVERPOD][DISPOSE] $name',
      );
    }
  }
}
