import 'package:app/app_bootstrap.dart';
import 'package:app/src/features/startup/data/fake_geolocator_repository.dart';
import 'package:app/src/features/startup/data/fake_user_location_repository.dart';
import 'package:app/src/features/startup/data/geolocator_repository.dart';
import 'package:app/src/features/startup/data/user_location_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension AppBootstrapFakes on AppBootStrap {
  ProviderContainer createFakeProviderContainer() {
    final userLocationRepository = FakeUserLocationRepository();
    final geoLocatorRepository = FakeGeoLocatorRepository();

    return ProviderContainer(
      overrides: [
        userLocationRepositoryProvider
            .overrideWithValue(userLocationRepository),
        geoLocatorRepositoryProvider.overrideWithValue(geoLocatorRepository),
      ],
    );
  }
}
