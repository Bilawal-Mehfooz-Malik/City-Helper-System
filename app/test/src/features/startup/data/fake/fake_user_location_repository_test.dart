import 'package:app/src/features/startup/data/fake/fake_user_location_repository.dart';
import 'package:app/src/features/startup/domain/geo_location.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late FakeUserLocationRepository userLocationRepository;
  final testUserLocation = GeoLocation(latitude: 123, longitude: 123);

  FakeUserLocationRepository makeUserLocationRepository() {
    return FakeUserLocationRepository(addDelay: false);
  }

  setUp(() {
    userLocationRepository = makeUserLocationRepository();
  });

  tearDown(() {
    userLocationRepository.dispose();
  });

  group('FakeUserLocationRepository Tests', () {
    test('getCurrentLocation returns the userLocation', () async {
      final result = await userLocationRepository.getCurrentLocation();
      expect(result, testUserLocation);
    });

    test('getLocationFromMap returns the userLocation', () async {
      final result = await userLocationRepository.getLocationFromMap();
      expect(result, testUserLocation);
    });
  });
}
