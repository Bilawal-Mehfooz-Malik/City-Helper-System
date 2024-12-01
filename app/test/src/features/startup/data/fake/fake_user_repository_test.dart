import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/features/startup/data/fake/fake_user_repository.dart';
import 'package:app/src/features/startup/domain/app_user.dart';
import 'package:latlong2/latlong.dart';

void main() {
  late FakeUserRepository userRepository;
  const testUserLocation = LatLng(123, 123);
  final testUser =
      AppUser(userLocation: testUserLocation, lastUpdated: DateTime.now());

  FakeUserRepository makeUserRepository() {
    return FakeUserRepository(addDelay: false);
  }

  setUp(() {
    userRepository = makeUserRepository();
  });

  tearDown(() {
    userRepository.dispose();
  });
  group('FakeUserRepository Tests', () {
    test('setUser sets the user correctly', () async {
      await userRepository.setUser(testUser);
      final result = await userRepository.fetchUser();
      expect(result, testUser);
    });

    test('fetchUser returns the correct user', () async {
      await userRepository.setUser(testUser);
      final result = await userRepository.fetchUser();
      expect(result, testUser);
    });

    test('watchUser returns the user as a stream', () async {
      final userStream = userRepository.watchUser();
      await userRepository.setUser(testUser);
      expectLater(userStream, emits(testUser));
    });

    test('fetchUser returns null when no user is set', () async {
      final result = await userRepository.fetchUser();
      expect(result, null);
    });
  });
}
