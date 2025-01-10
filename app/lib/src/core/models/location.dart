import 'package:app/src/features/startup/domain/user_location.dart';
import 'package:app/src/core/models/my_data_types.dart';

class Location {
  final EntityId id;
  final String country;
  final String province;
  final String city;
  final UserLocation geoLocation;
  final String streetAddress;

  Location({
    required this.id,
    required this.country,
    required this.province,
    required this.city,
    required this.geoLocation,
    required this.streetAddress,
  });
}
