import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_location.freezed.dart';
part 'user_location.g.dart';

@freezed
class UserLocation with _$UserLocation {
  const factory UserLocation({
    required double latitude,
    required double longitude,
  }) = _UserLocation;

  factory UserLocation.fromJson(Map<String, dynamic> json) =>
      _$UserLocationFromJson(json);
}
