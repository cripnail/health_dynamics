import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class DateFormatter {
  const DateFormatter._();

  static Future<void> init() async {
    await initializeDateFormatting('ru_RU', null);
  }

  static final DateFormat _monthDayFormatter = DateFormat.MMMd('ru_RU');
  static final DateFormat _dayFormatter = DateFormat.d('ru_RU');
  static final DateFormat _monthShortFormatter = DateFormat.MMM('ru_RU');

  static String formatMonthDay(DateTime date) =>
      _monthDayFormatter.format(date);

  static String formatDay(DateTime date) => _dayFormatter.format(date);

  static String formatMonthShort(DateTime date) =>
      _monthShortFormatter.format(date).toLowerCase();

  static String formatChartDate(DateTime date) {
    return '${formatDay(date)} ${formatMonthShort(date)}';
  }
}
