import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toFormatString({String format = 'yyyy/MM/dd'}) {
    final formatter = DateFormat(format, 'ja_JP');
    return formatter.format(this);
  }
}
