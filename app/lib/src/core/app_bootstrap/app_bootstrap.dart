import 'package:app/src/app.dart';
import 'package:app/src/core/exceptions/async_error_logger.dart';
import 'package:app/src/features/my_shop/data/user_mode_repository.dart';
import 'package:app/src/features/startup/data/real/user_location_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

  Future<void> setupEmulators() async {
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
    await FirebaseStorage.instance.useStorageEmulator('localhost', 9199);
    // * When running on the emulator, disable persistence to avoid discrepancies
    // * between the emulated database and local caches. More info here:
    // * https://firebase.google.com/docs/emulator-suite/connect_firestore#instrument_your_app_to_talk_to_the_emulators
    FirebaseFirestore.instance.settings = const Settings(
      persistenceEnabled: false,
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
