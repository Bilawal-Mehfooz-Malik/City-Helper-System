import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'date_formatter.g.dart';

@riverpod
DateFormat dateFormatter(Ref ref) {
  /// Date formatter to be used in the app.
  return DateFormat.MMMEd();
}

String formatTimeTo12Hour(String time24) {
  try {
    final input = DateFormat('HH:mm');
    final output = DateFormat('h:mm a');
    final dt = input.parse(time24);
    return output.format(dt);
  } catch (e) {
    return time24;
  }
}
