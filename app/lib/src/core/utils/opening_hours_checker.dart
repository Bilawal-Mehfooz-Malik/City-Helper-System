import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:flutter/material.dart';

class OpeningHoursChecker {
  static bool isOpenNow(Map<DayOfWeek, OpeningHours>? openingHours) {
    if (openingHours == null || openingHours.isEmpty) {
      return false; // Assume closed if no opening hours are provided
    }

    final now = DateTime.now();
    // Dart's weekday starts from 1 (Monday)
    final currentDay = DayOfWeek.values[now.weekday % 7];

    final todayHours = openingHours[currentDay];

    if (todayHours == null || todayHours.isDayOff) {
      return false; // Closed today
    }

    if (todayHours.is24Hours) {
      return true; // Open 24 hours
    }

    // Handle nullable slots
    if (todayHours.slots == null || todayHours.slots!.isEmpty) {
      return false; // Not 24 hours, not day off, but no slots defined
    }

    final currentTime = TimeOfDay(hour: now.hour, minute: now.minute);

    // Check if current time is within any of the time slots
    for (final slot in todayHours.slots!) {
      final startHour = int.parse(slot.open.split(':')[0]);
      final startMinute = int.parse(slot.open.split(':')[1]);
      final endHour = int.parse(slot.close.split(':')[0]);
      final endMinute = int.parse(slot.close.split(':')[1]);

      final startTime = TimeOfDay(hour: startHour, minute: startMinute);
      final endTime = TimeOfDay(hour: endHour, minute: endMinute);

      if (_isTimeBetween(currentTime, startTime, endTime)) {
        return true; // Open now
      }
    }

    return false; // Not open in any defined slot
  }

  static bool _isTimeBetween(
    TimeOfDay currentTime,
    TimeOfDay startTime,
    TimeOfDay endTime,
  ) {
    final currentMinutes = currentTime.hour * 60 + currentTime.minute;
    final startMinutes = startTime.hour * 60 + startTime.minute;
    final endMinutes = endTime.hour * 60 + endTime.minute;

    if (startMinutes <= endMinutes) {
      // Normal case: start and end on the same day
      return currentMinutes >= startMinutes && currentMinutes <= endMinutes;
    } else {
      // Overnight case: e.g., 22:00 - 02:00
      return currentMinutes >= startMinutes || currentMinutes <= endMinutes;
    }
  }
}
