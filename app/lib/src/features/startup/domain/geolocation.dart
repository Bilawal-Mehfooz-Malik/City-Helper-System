import 'package:freezed_annotation/freezed_annotation.dart';
part 'geolocation.freezed.dart';
part 'geolocation.g.dart';

@freezed
class GeoLocation with _$GeoLocation {
  const factory GeoLocation({
    required double latitude,
    required double longitude,
  }) = _GeoLocation;

  factory GeoLocation.fromJson(Map<String, Object?> json) =>
      _$GeoLocationFromJson(json);
}
