import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:app/src/core/models/time_slot.dart';

final Map<DayOfWeek, OpeningHours> defaultOpeningHours = {
  DayOfWeek.monday: const OpeningHours(
    slots: [TimeSlot(open: "09:00", close: "17:00")],
  ),
  DayOfWeek.tuesday: const OpeningHours(
    slots: [TimeSlot(open: "09:00", close: "17:00")],
  ),
  DayOfWeek.wednesday: const OpeningHours(
    slots: [TimeSlot(open: "09:00", close: "17:00")],
  ),
  DayOfWeek.thursday: const OpeningHours(
    slots: [TimeSlot(open: "09:00", close: "17:00")],
  ),
  DayOfWeek.friday: const OpeningHours(
    slots: [TimeSlot(open: "09:00", close: "17:00")],
  ),
  DayOfWeek.saturday: const OpeningHours(
    slots: [TimeSlot(open: "09:00", close: "17:00")],
  ),
  DayOfWeek.sunday: const OpeningHours(
    slots: [TimeSlot(open: "09:00", close: "17:00")],
  ),
};
