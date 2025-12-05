import 'package:app/src/features/pick_location/domain/user_location.dart';
import 'package:geocoding/geocoding.dart';
import 'package:app/src/features/pick_location/domain/coordinates.dart';

Future<UserLocation> getCityAndCountry(Coordinates coordinates) async {
  try {
    final placemarks = await placemarkFromCoordinates(
      coordinates.latitude,
      coordinates.longitude,
    );

    if (placemarks.isEmpty) {
      return UserLocation(
        coordinates: coordinates,
        countryName: '',
        cityName: '',
      );
    }

    final place = placemarks.first;
    return UserLocation(
      coordinates: coordinates,
      cityName: place.locality ?? place.subAdministrativeArea ?? '',
      countryName: place.country ?? '',
    );
  } catch (_) {
    return UserLocation(
      coordinates: coordinates,
      cityName: '',
      countryName: '',
    );
  }
}
