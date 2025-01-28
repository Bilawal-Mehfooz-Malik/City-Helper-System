import 'package:app/env.dart';
import 'package:app/src/app.dart';
import 'package:app/src/features/startup/data/real/user_location_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// * a conditional import is required here since on mobile we can't use dart:html
import 'package:universal_html/js.dart' as js
    if (dart.library.html) 'package:universal_html/js.dart';

class AppBootStrap {
  Widget createRootWidget({required ProviderContainer container}) {
    // * Written by Github Copilot to provide the Google Maps API key
    // * to the index.html file
    if (kIsWeb) {
      js.context['googleMapsKey'] = Env.googleMapsKey;
    }

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
    );
  }
}
