import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'app_bootstrap_fakes.dart';
import 'src/app.dart';

void main() async {
  // final container = await createFakesProviderContainer();
  // Load env files
  await dotenv.load();

  const root = ProviderScope(
    child: MyApp(),
  );

  runApp(root);
}
