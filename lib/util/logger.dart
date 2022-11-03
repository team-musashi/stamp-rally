import 'dart:io';

import 'package:roggle/roggle.dart';

const _loggerName = '[APP]';

/// ロガー
///
/// どこから呼び出してOK
/// ログレベル毎の使い分けは次の通り
/// verbose: 垂れ流し系、大量に出力される場合
/// debug: デバッグ時に一時的に使う場合
/// info: ユーザーイベントなど、通常のログ
/// warning: 注意喚起を促す
/// error: エラー発生時
/// wtf: あり得ないことが起きた時
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
