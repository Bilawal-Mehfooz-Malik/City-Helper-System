import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sembast/sembast_memory.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app/src/features/startup/data/real/user_location_repository.dart';

void main() {
  late Database testDb;
  late UserLocationRepository userLocationRepository;

  const testLocation1 = LatLng(11.0, 11.0);
  const testLocation2 = LatLng(40.7128, -74.0060);

  setUp(() async {
    testDb = await newDatabaseFactoryMemory().openDatabase('test.db');
    userLocationRepository = UserLocationRepository(testDb, timeOut: 15);
  });

  tearDown(() async {
    await testDb.close();
  });

  group('setUserLocation', () {
    test('successfully saves valid location', () async {
      // run
      await userLocationRepository.setUserLocation(testLocation1);
      final stored = await userLocationRepository.fetchUserLocation();

      // verify
      expect(stored, equals(testLocation1));
    });

    test('handles database write errors', () async {
      // setup
      await testDb.close();

      // verify
      expect(
        () => userLocationRepository.setUserLocation(testLocation1),
        throwsA(isA<DatabaseException>()),
      );
    });

    test('handles concurrent write operations', () async {
      // run
      await Future.wait([
        userLocationRepository.setUserLocation(testLocation1),
        userLocationRepository.setUserLocation(testLocation2),
      ]);

      // verify
      final stored = await userLocationRepository.fetchUserLocation();
      expect(stored, equals(testLocation2));
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
      await userLocationRepository.setUserLocation(testLocation1);

      // run
      final latLng = await userLocationRepository.fetchUserLocation();

      // verify
      expect(latLng, testLocation1);
    },
  );

  test('watchUserLocation emits updates correctly', () async {
    // setup
    final emittedValues = <LatLng?>[];
    final subscription = userLocationRepository.watchUserLocation().listen(
      emittedValues.add,
    );

    // run

    await userLocationRepository.setUserLocation(testLocation1);
    await userLocationRepository.setUserLocation(testLocation2);

    // Wait for the updates to propagate
    await Future<void>.delayed(Duration.zero);

    // Verify
    expect(emittedValues, [isNull, testLocation1, testLocation2]);
    await subscription.cancel();
  });

  test('watchUserLocation emits null for firstTime', () async {
    // setup
    final emittedValues = <LatLng?>[];
    final subscription = userLocationRepository.watchUserLocation().listen(
      emittedValues.add,
    );

    // Wait for the updates to propagate
    await Future<void>.delayed(Duration.zero);

    // Verify
    expect(emittedValues, [isNull]);
    await subscription.cancel();
  });
}
