import 'package:freezed_annotation/freezed_annotation.dart';

part 'opening_hours.freezed.dart';
part 'opening_hours.g.dart';

@freezed
abstract class OpeningHours with _$OpeningHours {
  const factory OpeningHours({
    required String day,
    required String open,
    required String close,
  }) = _OpeningHours;

  factory OpeningHours.fromJson(Map<String, Object?> json) =>
      _$OpeningHoursFromJson(json);
}
