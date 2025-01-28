import 'package:app/src/features/startup/data/real/geolocator_repository.dart';
import 'package:app/src/features/startup/data/real/user_location_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mocktail/mocktail.dart';

class MockGeoLocator extends Mock implements GeolocatorPlatform {}

class MockGeoLocatorRepository extends Mock implements GeoLocatorRepository {}

class MockUserLocationRepository extends Mock
    implements UserLocationRepository {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}
