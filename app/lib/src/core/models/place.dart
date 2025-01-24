import 'package:app/src/features/startup/domain/geolocation.dart';
import 'package:app/src/core/models/my_data_types.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'place.freezed.dart';
part 'place.g.dart';

@freezed
class Place with _$Place {
  const factory Place({
    required EntityId id,
    required String name,
    GeoLocation? geoLocation,
    String? streetAddress,
  }) = _Place;

  factory Place.fromJson(Map<String, Object?> json) => _$PlaceFromJson(json);
}
