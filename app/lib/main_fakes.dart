import 'package:app/src/core/app_bootstrap/app_bootstrap.dart';
import 'package:app/src/core/app_bootstrap/app_bootstrap_fakes.dart';
import 'package:flutter/material.dart';
// ignore:depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
// Conditional import: Web loads `configure_web.dart`, others load `configure_nonweb.dart`
import 'package:app/src/core/app_config/configure_nonweb.dart'
    if (dart.library.html) 'package:app/configure_web.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // turn off the # in the URLs on the web
  usePathUrlStrategy();
  // Inject Google Maps script on web
  configureGoogleMapsWeb();
  final appBootStrap = AppBootStrap();
  final container = appBootStrap.createFakeProviderContainer();
  final root = appBootStrap.createRootWidget(container: container);
  runApp(root);
}