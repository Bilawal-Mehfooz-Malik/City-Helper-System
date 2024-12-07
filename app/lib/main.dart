import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_bootstrap.dart';
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = await createProviderContainer();

  // Load env files
  await dotenv.load();

  final root = UncontrolledProviderScope(
    container: container,
    child: const MyApp(),
  );

  runApp(root);
}
