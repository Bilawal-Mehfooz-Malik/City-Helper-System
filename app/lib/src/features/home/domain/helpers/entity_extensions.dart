import 'package:app/src/core/exceptions/app_logger.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/entity.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/list_extensions.dart';

extension EntityExtensions on Entity {
  bool isEntityOpen() {
    if (entityStatus == OperationalStatus.close) return false;
    if (entityStatus == OperationalStatus.open) return true;

    final now = DateTime.now().toLocal();
    final currentDay = DateFormat('EEEE').format(now);

    final todayOpeningHours = openingHours.firstWhereOrNull(
      (hours) => hours.day.toLowerCase() == currentDay.toLowerCase(),
    );

    if (todayOpeningHours == null) return false;

    if (todayOpeningHours.open == todayOpeningHours.close) {
      return true; // Open 24 hours
    }

    try {
      final format = DateFormat("HH:mm");

      final openParsed = format.parse(todayOpeningHours.open);
      final closeParsed = format.parse(todayOpeningHours.close);

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
      return false;
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
