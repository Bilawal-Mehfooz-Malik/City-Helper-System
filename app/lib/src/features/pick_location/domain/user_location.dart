import 'package:app/src/features/pick_location/domain/coordinates.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_location.freezed.dart';
part 'user_location.g.dart';

@freezed
abstract class UserLocation with _$UserLocation {
  const factory UserLocation({
    required Coordinates coordinates,
    required String? countryName,
    required String? cityName,
  }) = _UserLocation;

  factory UserLocation.fromJson(Map<String, Object?> json) =>
      _$UserLocationFromJson(json);
}
