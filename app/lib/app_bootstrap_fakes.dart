import 'package:app/src/features/startup/data/fake_user_repository.dart';
import 'package:app/src/features/startup/domain/user_location_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<ProviderContainer> createFakesProviderContainer({
  bool addDelay = true,
}) async {
  final userRepository = FakeUserLocationRepository(addDelay: addDelay);

  return ProviderContainer(
    overrides: [
      userLocationRepositoryProvider.overrideWithValue(userRepository),
    ],
  );
}
