import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_bootstrap_fakes.dart';
import 'src/app.dart';

void main() async {
  final container = await createFakesProviderContainer();
  final root = UncontrolledProviderScope(
    container: container,
    child: const MyApp(),
  );

  // * Main App
  runApp(root);
}
