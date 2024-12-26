import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

const String dateTimeExtension on dateTime {
  String format({
    String pattern = datetimeFormatPattern,
    String? locale,
  }) {
    if (locale != null && locale.isNotEmpty) {
      intializeDateFormatting(locale);
    } 
    return DateFormat(pattern, locale).format(this);
  }
}