import 'package:app/src/features/startup/data/fake/fake_user_location_repository.dart';
import 'package:app/src/features/startup/data/fake/fake_user_repository.dart';
import 'package:app/src/features/startup/domain/user_location_repository.dart';
import 'package:app/src/features/startup/domain/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<ProviderContainer> createFakesProviderContainer({
  bool addDelay = true,
}) async {
  final userRepository = FakeUserRepository(addDelay: addDelay);
  final userLocationRepository = FakeUserLocationRepository(addDelay: addDelay);

  return ProviderContainer(
    overrides: [
      userRepositoryProvider.overrideWithValue(userRepository),
      userLocationRepositoryProvider.overrideWithValue(userLocationRepository),
    ],
  );
}
