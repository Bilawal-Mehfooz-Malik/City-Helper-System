import 'package:app/src/core/exceptions/app_logger.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

class Entity {
  final EntityId id;
  final CategoryId categoryId;
  final SubCategoryId subCategoryId;
  final String coverImageUrl;
  final String name;
  final String cityName;
  final String sectorName;
  final LatLng geoLocation;
  final double avgRating;
  final int totalReviews;
  final bool isPopular;
  final List<OpeningHours> openingHours;
  final bool status;
  final DateTime createdAt;

  const Entity({
    required this.id,
    required this.categoryId,
    required this.subCategoryId,
    required this.coverImageUrl,
    required this.name,
    required this.cityName,
    required this.sectorName,
    required this.geoLocation,
    required this.avgRating,
    required this.totalReviews,
    required this.isPopular,
    required this.openingHours,
    required this.status,
    required this.createdAt,
  });

  bool isEntityOpen() {
    // First, check the entity's overall status
    if (!status) {
      return false; // Entity is explicitly closed
    }

    // Get the current time and day
    final now = DateTime.now();
    final currentDay = DateFormat('EEEE').format(now);

    // Find the opening hours for the current day
    final todayOpeningHours = openingHours.firstWhereOrNull(
      (hours) => hours.day == currentDay,
    );

    // If no hours are specified for today, it's considered closed
    if (todayOpeningHours == null) {
      return false;
    }

    // If start and end times are the same, it might mean closed all day,
    // or open 24 hours depending on convention. Assuming closed if times are equal.
    if (todayOpeningHours.startTime == todayOpeningHours.endTime) {
      return true; // adjusted based on '24 hours' convention
    }

    try {
      // Parse start and end times
      // We need to parse these times relative to TODAY's date to compare them
      final format = DateFormat("h:mm a"); // Format like '9:00 AM'

      // Combine today's date with the start and end times for accurate comparison
      final startTimeDateTime = format.parse(todayOpeningHours.startTime);
      final endTimeDateTime = format.parse(todayOpeningHours.endTime);

      // Create DateTime objects for today with the parsed times
      final startToday = DateTime(
        now.year,
        now.month,
        now.day,
        startTimeDateTime.hour,
        startTimeDateTime.minute,
      );
      final endToday = DateTime(
        now.year,
        now.month,
        now.day,
        endTimeDateTime.hour,
        endTimeDateTime.minute,
      );

      // Handle overnight hours (e.g., if endTime is before startTime, it means it closes the next day)
      if (endToday.isBefore(startToday)) {
        // Add one day to the end time if it's for the next day
        return now.isAfter(startToday) ||
            now.isBefore(endToday.add(Duration(days: 1)));
      } else {
        // Normal opening hours within the same day
        return now.isAfter(startToday) && now.isBefore(endToday);
      }
    } catch (e, st) {
      // Handle potential parsing errors if time format is unexpected
      AppLogger.logError(
        'Error parsing opening hours for $name',
        error: e,
        stackTrace: st,
      );
      return false; // Assume closed if times can't be parsed
    }
  }
}
