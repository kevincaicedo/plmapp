import 'package:intl/intl.dart';

extension Format on DateTime {
  String format({String pattern = 'yyyy-MM-dd'}) {
    if (this == null) return null;
    var formatter = new DateFormat(pattern);
    return formatter.format(this);
  }
}
