import 'package:app/src/localization/i18n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'localization/localization_extension.dart';
import 'routers/app_router.dart';
import 'themes/light_theme.dart';

/// The Widget that configures application.
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lightTheme = ref.watch(lightThemeProvider);
    final appRouter = ref.watch(appRouterProvider);

    return MaterialApp.router(
      restorationScopeId: 'app',

      debugShowCheckedModeBanner: false,

      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: lightTheme,
      darkTheme: ThemeData.dark(),
      routerConfig: appRouter,
      supportedLocales: const [Locale('en', '')],
      onGenerateTitle: (BuildContext context) => context.loc.appTitle,
    );
  }
}
