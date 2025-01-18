import 'package:app/src/features/startup/domain/user_location.dart';
import 'package:app/src/core/models/my_data_types.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
class Location with _$Location {
  const factory Location({
    required EntityId id,
    required String name,
    GeoLocation? geoLocation,
    required String streetAddress,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
