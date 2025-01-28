import 'package:app/app_bootstrap.dart';
import 'package:app/src/features/startup/data/fake/fake_geolocator_repository.dart';
import 'package:app/src/features/startup/data/fake/fake_user_location_repository.dart';
import 'package:app/src/features/startup/data/real/geolocator_repository.dart';
import 'package:app/src/features/startup/data/real/user_location_repository.dart';
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
