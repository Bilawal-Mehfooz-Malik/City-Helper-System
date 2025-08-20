import 'package:app/src/core/exceptions/app_logger.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/entity.dart';
import 'package:intl/intl.dart';

extension EntityExtensions on Entity {
  bool isEntityOpen() {
    if (this is Residence) {
      final residence = this as Residence;
      if (residence.listingType == ListingType.forSale) {
        return false;
      }
    }

    final openingHours = this.openingHours;
    final entityStatus = this.entityStatus;

    if (entityStatus == OperationalStatus.close) return false;
    if (entityStatus == OperationalStatus.open) return true;

    if (openingHours.isEmpty) {
      return false;
    }

    final now = DateTime.now().toLocal();
    final currentDay = DateFormat('EEEE').format(now);

    final todayOpeningHours = openingHours.firstWhereOrNull(
      (hours) => hours.day.toLowerCase() == currentDay.toLowerCase(),
    );

    if (todayOpeningHours == null || !todayOpeningHours.isOpen) {
      return false;
    }

    final openTimeStr = todayOpeningHours.open;
    final closeTimeStr = todayOpeningHours.close;
    if (openTimeStr == null || closeTimeStr == null) {
      return true;
    }

    if (openTimeStr == closeTimeStr) {
      return true;
    }

    try {
      DateTime openParsed, closeParsed;
      try {
        // First, try parsing with AM/PM format
        final format = DateFormat("h:mm a");
        openParsed = format.parse(openTimeStr);
        closeParsed = format.parse(closeTimeStr);
      } on FormatException {
        // If that fails, fall back to 24-hour format
        final format = DateFormat("HH:mm");
        openParsed = format.parse(openTimeStr);
        closeParsed = format.parse(closeTimeStr);
      }

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
        'Opening hour parse error for ${this.name}',
        error: e,
        stackTrace: st,
      );
      return false;
    }
  }

  bool matchGenderPref(GenderPreference preference) {
    if (preference == GenderPreference.any) return true;
    if (this is Residence) {
      final residence = this as Residence;
      if (residence.listingType == ListingType.forSale) {
        return false; // Not applicable for properties for sale
      }
      // If genderPref is null, it means no preference is set, so it matches 'any'.
      // Otherwise, it must match the exact preference.
      return residence.genderPref == GenderPreference.any ||
          residence.genderPref == preference;
    } else if (this is Food) {
      final food = this as Food;
      return food.genderPref == preference;
    }
    return false; // Should not happen
  }

  bool checkFurnished(bool furnished) {
    if (this is Residence) {
      final residence = this as Residence;
      if (residence.listingType == ListingType.forSale) {
        return false; // Not applicable for properties for sale
      }
      return residence.isFurnished == furnished;
    } else if (this is Food) {
      // Not applicable for food, always return true as per original logic
      return true;
    }
    return false; // Should not happen
  }
}
