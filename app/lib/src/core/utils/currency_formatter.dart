import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'currency_formatter.g.dart';

@riverpod
NumberFormat currencyFormatter(Ref ref) {
  /// Currency formatter to be used in the app.
  /// * The locale is set to 'ur_PK' to format prices in Pakistani Rupees.
  /// * A space and dot are added to display the currency as 'Rs. '.
  return NumberFormat.currency(
    locale: 'ur_PK',
    symbol: 'Rs. ',
    decimalDigits: 0,
  );
}
