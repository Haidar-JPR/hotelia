import 'package:intl/intl.dart';

class AppFormat {
  // NOTE: Parsing Date Format to get Format Like This (5 Feb 2023)
  static String date(String stringDate) {
    // NOTE: 2023-02-05
    DateTime dateTime = DateTime.parse(stringDate);
    // NOTE: 5 Feb 2023
    return DateFormat('d MMM yyyy', 'en_US').format(dateTime);
  }

  // NOTE: Parsing Date Format to get Format Like This (5 Feb)
  static String dateMonth(String stringDate) {
    // NOTE: 2023-02-05
    DateTime dateTime = DateTime.parse(stringDate);

    // NOTE: 5 Feb
    return DateFormat('d MMM', 'en_US').format(dateTime);
  }

  // NOTE: Parsing Money Symbol on String Format Dollar ($)
  static String currency(double number) {
    return NumberFormat.currency(
      decimalDigits: 0,
      locale: 'en_US',
      symbol: '\$',
    ).format(number);
  }
}
