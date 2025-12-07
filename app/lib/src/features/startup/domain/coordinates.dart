import 'package:freezed_annotation/freezed_annotation.dart';

part 'coordinates.freezed.dart';
part 'coordinates.g.dart';

@freezed
abstract class Coordinates with _$Coordinates {
  const factory Coordinates({
    required double latitude,
    required double longitude,
  }) = _Coordinates;

  factory Coordinates.fromJson(Map<String, Object?> json) =>
      _$CoordinatesFromJson(json);
}
