import 'package:app/src/core/exceptions/app_logger.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:intl/intl.dart';

extension EntityDetailExtensions on EntityDetail {
  bool isEntityOpen() {
    if (this is ResidenceDetail) {
      final residence = this as ResidenceDetail;
      if (residence.listingType == ListingType.forSale) {
        return false; // Properties for sale are never "open" in this context
      }
      // For rental residences, proceed with opening hours logic
      // Note: openingHours and entityStatus are nullable for Residence
      final openingHours = residence.openingHours;
      final entityStatus = residence.entityStatus;

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

        if (closeTime.isBefore(openTime)) {
          closeTime = closeTime.add(const Duration(days: 1));
        }

        return now.isAfter(openTime) && now.isBefore(closeTime);
      } catch (e, st) {
        AppLogger.logError(
          'Opening hour parse error for ${residence.name}',
          error: e,
          stackTrace: st,
        );
        return false;
      }
    } else if (this is FoodDetail) {
      final food = this as FoodDetail;
      // Food entities always have required openingHours and entityStatus
      final openingHours = food.openingHours;
      final entityStatus = food.entityStatus;

      if (entityStatus == OperationalStatus.close) return false;
      if (entityStatus == OperationalStatus.open) return true;

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

        if (closeTime.isBefore(openTime)) {
          closeTime = closeTime.add(const Duration(days: 1));
        }

        return now.isAfter(openTime) && now.isBefore(closeTime);
      } catch (e, st) {
        AppLogger.logError(
          'Opening hour parse error for ${food.name}',
          error: e,
          stackTrace: st,
        );
        return false;
      }
    }
    return false; // Should not happen if sealed class is exhaustive
  }

  bool matchGenderPref(GenderPreference preference) {
    if (preference == GenderPreference.any) return true;
    if (this is ResidenceDetail) {
      final residence = this as ResidenceDetail;
      if (residence.listingType == ListingType.forSale) {
        return false; // Not applicable for properties for sale
      }
      // If genderPref is null, it means no preference is set, so it matches 'any'.
      // Otherwise, it must match the exact preference.
      return residence.genderPref == GenderPreference.any ||
          residence.genderPref == preference;
    } else if (this is FoodDetail) {
      final food = this as FoodDetail;
      return food.genderPref == preference;
    }
    return false; // Should not happen
  }

  bool checkFurnished(bool furnished) {
    if (this is ResidenceDetail) {
      final residence = this as ResidenceDetail;
      if (residence.listingType == ListingType.forSale) {
        return false; // Not applicable for properties for sale
      }
      return residence.isFurnished == furnished;
    } else if (this is FoodDetail) {
      // Not applicable for food, always return true as per original logic
      return true;
    }
    return false; // Should not happen
  }
}
