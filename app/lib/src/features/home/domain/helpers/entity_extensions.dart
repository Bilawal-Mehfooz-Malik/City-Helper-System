import 'package:app/src/core/exceptions/app_logger.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/list_extensions.dart';
import 'package:app/src/features/home/domain/entity.dart';
import 'package:intl/intl.dart';

extension EntityExtensions on Entity {
  bool isEntityOpen() {
    // 1. Check for a global override status.
    if (entityStatus == OperationalStatus.close) {
      return false; // Permanent closed
    }
    if (entityStatus == OperationalStatus.open) return true; // Always open

    // 2. Find the opening hours for the current day.
    final now = DateTime.now().toLocal();
    final currentDay = DateFormat('EEEE').format(now);

    final todayOpeningHours = openingHours.firstWhereOrNull(
      (hours) => hours.day.toLowerCase() == currentDay.toLowerCase(),
    );

    // 3. If no entry for today, or if it's explicitly marked as closed, then it's closed.
    if (todayOpeningHours == null || !todayOpeningHours.isOpen) {
      return false;
    }

    // 4. If it's open today, but no specific times are provided, assume it's open all day.
    final openTimeStr = todayOpeningHours.open;
    final closeTimeStr = todayOpeningHours.close;
    if (openTimeStr == null || closeTimeStr == null) {
      return true;
    }

    // 5. If open and close times are the same, it's open 24 hours.
    if (openTimeStr == closeTimeStr) {
      return true;
    }

    // 6. Parse the times and check if the current time is within the range.
    try {
      final format = DateFormat("HH:mm");
      final openParsed = format.parse(openTimeStr);
      final closeParsed = format.parse(closeTimeStr);

      final openTime = DateTime(
        now.year,
        now.month,
        now.day,
        openParsed.hour,
        openParsed.minute,
      );
      var closeTime = DateTime(
        now.year,
        now.month,
        now.day,
        closeParsed.hour,
        closeParsed.minute,
      );

      // Handle cases where the closing time is on the next day (e.g., open 22:00, close 02:00).
      if (closeTime.isBefore(openTime)) {
        closeTime = closeTime.add(const Duration(days: 1));
      }

      return now.isAfter(openTime) && now.isBefore(closeTime);
    } catch (e, st) {
      AppLogger.logError(
        'Opening hour parse error for $name',
        error: e,
        stackTrace: st,
      );
      return false; // If parsing fails for any reason, assume it's closed.
    }
  }

  bool matchGenderPref(GenderPreference preference) {
    if (preference == GenderPreference.any) return true;
    return when(
      residence:
          (_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, genderPref) =>
              genderPref == preference,
      food: (_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, genderPref) =>
          genderPref == preference,
    );
  }

  bool checkFurnished(bool furnished) {
    return when(
      residence:
          (_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, isFurnished, _) =>
              isFurnished == furnished,
      food: (_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _) =>
          true, // Not applicable for food
    );
  }
}
