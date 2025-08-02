import 'package:app/src/app.dart';
import 'package:app/src/core/exceptions/async_error_logger.dart';
import 'package:app/src/features/my_shop/data/user_mode_repository.dart';
import 'package:app/src/features/startup/data/real/user_location_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBootStrap {
  Widget createRootWidget({required ProviderContainer container}) {
    return UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    );
  }
}

extension CreateProviderContainer on AppBootStrap {
  Future<ProviderContainer> createProviderContainer() async {
    // Initialize SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final userLocationRepository = UserLocationRepository(prefs);
    final userModeReposiory = UserModeRepository(prefs);

    return ProviderContainer(
      overrides: [
        userLocationRepositoryProvider.overrideWithValue(
          userLocationRepository,
        ),
        userModeRepositoryProvider.overrideWithValue(userModeReposiory),
      ],
      observers: [
        // * This observer logs all AsyncError states that are set by the controllers
        AsyncErrorLogger(),
      ],
    );
  }
}
