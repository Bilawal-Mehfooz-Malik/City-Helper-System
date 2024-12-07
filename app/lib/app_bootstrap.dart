import 'package:app/src/features/startup/data/user_location_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<ProviderContainer> createProviderContainer({
  bool addDelay = true,
}) async {
  final userRepository = await UserLocationRepository.makeDefault();

  return ProviderContainer(
    overrides: [
      userLocationRepositoryProvider.overrideWithValue(userRepository),
    ],
  );
}
