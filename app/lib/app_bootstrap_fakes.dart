import 'package:app/app_bootstrap.dart';
import 'package:app/src/core/exceptions/async_error_logger.dart';
import 'package:app/src/features/startup/data/fake/fake_geolocator_repository.dart';
import 'package:app/src/features/startup/data/fake/fake_location_search_repository.dart';
import 'package:app/src/features/startup/data/fake/fake_user_location_repository.dart';
import 'package:app/src/features/startup/data/real/geolocator_repository.dart';
import 'package:app/src/features/startup/data/real/location_search_repository.dart';
import 'package:app/src/features/startup/data/real/user_location_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension AppBootstrapFakes on AppBootStrap {
  ProviderContainer createFakeProviderContainer() {
    final userLocationRepository = FakeUserLocationRepository();
    final geoLocatorRepository = FakeGeoLocatorRepository();
    final locationsearchRepository = FakeLocationSearchRepository();

    return ProviderContainer(
      overrides: [
        // * [StartupFeatureRepository] is overridden with [FakeStartupFeatureRepository]
        userLocationRepositoryProvider
            .overrideWithValue(userLocationRepository),
        geoLocatorRepositoryProvider.overrideWithValue(geoLocatorRepository),
        locationSearchRepositoryProvider
            .overrideWithValue(locationsearchRepository),
      ],
      observers: [
        // * This observer logs all AsyncError states that are set by the controllers
        AsyncErrorLogger(),
      ],
    );
  }
}
