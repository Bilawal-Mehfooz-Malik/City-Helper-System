import 'package:app/src/core/models/time_slot.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'opening_hours.freezed.dart';
part 'opening_hours.g.dart';

@freezed
abstract class OpeningHours with _$OpeningHours {
  const factory OpeningHours({
    @Default(false) bool isDayOff,
    @Default(false) bool is24Hours,
    required List<TimeSlot> slots,
  }) = _OpeningHours;

  factory OpeningHours.fromJson(Map<String, Object?> json) =>
      _$OpeningHoursFromJson(json);
}
