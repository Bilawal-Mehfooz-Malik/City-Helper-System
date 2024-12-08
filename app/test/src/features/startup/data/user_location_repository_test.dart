import 'package:latlong2/latlong.dart';
import 'package:sembast/sembast_memory.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app/src/features/startup/data/user_location_repository.dart';

void main() {
  late Database testDb;
  late UserLocationRepository userLocationRepository;

  const testLatLng = LatLng(12.0, 10.0);

  setUp(() async {
    testDb = await newDatabaseFactoryMemory().openDatabase('test.db');
    userLocationRepository = UserLocationRepository(testDb);
  });

  tearDown(() async {
    await testDb.close();
  });

  group('UserLocationRepository', () {
    test('fetchUserLocation returns null if no data is stored', () async {
      // run
      final latLng = await userLocationRepository.fetchUserLocation();

      // verify
      expect(latLng, isNull);
    });

    test(
        'setUserLocation sets testLatLng and then fetchUserLocation returns testLatLng',
        () async {
      // setup
      await userLocationRepository.setUserLocation(testLatLng);

      // run
      final latLng = await userLocationRepository.fetchUserLocation();

      // verify
      expect(latLng, testLatLng);
    });

    test('watchUserLocation emits updates correctly', () async {
      // setup
      final emittedValues = <LatLng?>[];
      final subscription =
          userLocationRepository.watchUserLocation().listen(emittedValues.add);

      // run
      const latLng1 = LatLng(10.0, 20.0);
      await userLocationRepository.setUserLocation(latLng1);
      const latLng2 = LatLng(30.0, 40.0);
      await userLocationRepository.setUserLocation(latLng2);

      // Wait for the updates to propagate
      await Future.delayed(Duration.zero);

      // Verify
      expect(emittedValues, [isNull, latLng1, latLng2]);
      await subscription.cancel();
    });

    test('watchUserLocation emits null for firstTime', () async {
      // setup
      final emittedValues = <LatLng?>[];
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
