import 'package:app/src/features/categories_list/data/categories_repository.dart';
import 'package:app/src/features/pick_location/data/geolocator_repository.dart';
import 'package:app/src/features/startup/data/real/user_location_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockGeolocatorPlatform extends Mock implements GeolocatorPlatform {}

class MockGeoLocator extends Mock implements GeolocatorPlatform {}

class MockGeoLocatorRepository extends Mock implements GeoLocatorRepository {}

class MockUserLocationRepository extends Mock
    implements UserLocationRepository {}

class MockCategoriesRepository extends Mock implements CategoriesRepository {}

// Define a fake LatLng for mocktail's registerFallbackValue
class FakeLatLng extends Fake implements LatLng {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}
