import 'package:app/app_bootstrap.dart';
import 'package:app/app_bootstrap_fakes.dart';
import 'package:flutter/material.dart';
// ignore:depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // turn off the # in the URLs on the web
  usePathUrlStrategy();
  final appBootStrap = AppBootStrap();
  final container = appBootStrap.createFakeProviderContainer();
  final root = appBootStrap.createRootWidget(container: container);
  runApp(root);
}
