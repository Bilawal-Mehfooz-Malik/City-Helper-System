import 'package:app/src/features/startup/domain/geolocation.dart';
import 'package:sembast/sembast_memory.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app/src/features/startup/data/real/user_location_repository.dart';

void main() {
  late Database testDb;
  late UserLocationRepository userLocationRepository;

  const testLocation = GeoLocation(latitude: 11.0, longitude: 11.0);

  setUp(() async {
    testDb = await newDatabaseFactoryMemory().openDatabase('test.db');
    userLocationRepository = UserLocationRepository(testDb, timeOut: 15);
  });

  tearDown(() async {
    await testDb.close();
  });

  group('UserLocationRepository', () {
    group('setUserLocation', () {
      test('successfully saves valid location', () async {
        // run
        await userLocationRepository.setUserLocation(testLocation);
        final stored = await userLocationRepository.fetchUserLocation();

        // verify
        expect(stored, equals(testLocation));
      });

      test('handles database write errors', () async {
        // setup
        await testDb.close();

        // verify
        expect(
          () => userLocationRepository.setUserLocation(testLocation),
          throwsA(isA<DatabaseException>()),
        );
      });

      test('handles concurrent write operations', () async {
        // setup
        const location1 = GeoLocation(latitude: 40.7128, longitude: -74.0060);

        // run
        await Future.wait([
          userLocationRepository.setUserLocation(testLocation),
          userLocationRepository.setUserLocation(location1)
        ]);

        // verify
        final stored = await userLocationRepository.fetchUserLocation();
        expect(stored, equals(location1));
      });
    });

    test('fetchUserLocation returns null if no data is stored', () async {
      // run
      final userLocation = await userLocationRepository.fetchUserLocation();

      // verify
      expect(userLocation, isNull);
    });

    test(
        'setUserLocation sets testLatLng and then fetchUserLocation returns testLatLng',
        () async {
      // setup
      await userLocationRepository.setUserLocation(testLocation);

      // run
      final latLng = await userLocationRepository.fetchUserLocation();

      // verify
      expect(latLng, testLocation);
    });

    test('watchUserLocation emits updates correctly', () async {
      // setup
      final emittedValues = <GeoLocation?>[];
      final subscription =
          userLocationRepository.watchUserLocation().listen(emittedValues.add);

      // run
      const latLng1 = GeoLocation(latitude: 2.0, longitude: 1.0);
      await userLocationRepository.setUserLocation(latLng1);
      const latLng2 = GeoLocation(latitude: 12.0, longitude: 12.0);
      await userLocationRepository.setUserLocation(latLng2);

      // Wait for the updates to propagate
      await Future.delayed(Duration.zero);

      // Verify
      expect(emittedValues, [isNull, latLng1, latLng2]);
      await subscription.cancel();
    });

    test('watchUserLocation emits null for firstTime', () async {
      // setup
      final emittedValues = <GeoLocation?>[];
      final subscription =
          userLocationRepository.watchUserLocation().listen(emittedValues.add);

      // Wait for the updates to propagate
      await Future.delayed(Duration.zero);

      // Verify
      expect(emittedValues, [isNull]);
      await subscription.cancel();
    });
  });
}
