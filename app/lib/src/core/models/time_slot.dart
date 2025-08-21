import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_slot.freezed.dart';
part 'time_slot.g.dart';

@freezed
abstract class TimeSlot with _$TimeSlot {
  const factory TimeSlot({
    required String open,
    required String close,
  }) = _TimeSlot;

  factory TimeSlot.fromJson(Map<String, Object?> json) =>
      _$TimeSlotFromJson(json);
}
