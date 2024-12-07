import 'package:app/src/features/startup/data/location_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mocktail/mocktail.dart';

class MockLocationRepository extends Mock implements LocationRepository {}

class MockGeoLocator extends Mock implements GeolocatorPlatform {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}
