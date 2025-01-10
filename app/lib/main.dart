// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import 'package:app/app_bootstrap.dart';
import 'package:app/env.dart';
import 'package:app/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // * Written by Github Copilot to provide the Google Maps API key
  // * to the index.html file
  js.context['googleMapsKey'] = Env.googleMapsKey;
  final container = await createProviderContainer();

  final root = UncontrolledProviderScope(
    container: container,
    child: const MyApp(),
  );

  runApp(root);
}
