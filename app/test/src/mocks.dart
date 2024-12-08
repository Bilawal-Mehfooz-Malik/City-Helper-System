import 'package:app/src/features/startup/data/location_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sembast/sembast.dart';

class MockGeoLocator extends Mock implements GeolocatorPlatform {}

class MockDatabase extends Mock implements Database {}

class MockStoreRef extends Mock implements StoreRef<Object?, Object?> {}

class MockRecordRef extends Mock implements RecordRef<Object?, Object?> {}

class MockRecordSnapshot extends Mock
    implements RecordSnapshot<String, Object?> {}

class MockLocationRepository extends Mock implements LocationRepository {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}
