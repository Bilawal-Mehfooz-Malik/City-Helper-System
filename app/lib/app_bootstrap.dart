import 'package:app/env.dart';
import 'package:app/src/app.dart';
import 'package:app/src/core/exceptions/async_error_logger.dart';
import 'package:app/src/features/startup/data/real/user_location_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppBootStrap {
  Future<void> initializeLocalSupabase() async {
    await Supabase.initialize(
      url: Env.supabaseLocalApiUrl,
      anonKey: Env.supabaseLocalAnonKey,
    );
  }

  Future<void> initializeSupabase() async {
    await Supabase.initialize(
      url: Env.supabaseApiUrl,
      anonKey: Env.supabaseAnonKey,
    );
  }

  Widget createRootWidget({required ProviderContainer container}) {
    return UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    );
  }
}

extension CreateProviderContainer on AppBootStrap {
  Future<ProviderContainer> createProviderContainer() async {
    final userRepository = await UserLocationRepository.makeDefault();

    return ProviderContainer(
      overrides: [
        userLocationRepositoryProvider.overrideWithValue(userRepository),
      ],
      observers: [
        // * This observer logs all AsyncError states that are set by the controllers
        AsyncErrorLogger(),
      ],
    );
  }
}
