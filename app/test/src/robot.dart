import 'package:app/src/core/app_bootstrap/app_bootstrap.dart';
import 'package:app/src/core/app_bootstrap/app_bootstrap_fakes.dart';
import 'package:app/src/app.dart';
import 'package:app/src/localization/i18n/app_localizations.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'features/categories_list/categories_robot.dart';
import 'features/startup/startup_robot.dart';
import 'goldens/golden_robot.dart';

class Robot {
  Robot(this.tester)
    : startupRobot = StartupRobot(tester),
      categoriesRobot = CategoriesRobot(tester),
      golden = GoldenRobot(tester);

  final WidgetTester tester;
  final GoldenRobot golden;
  final StartupRobot startupRobot;
  final CategoriesRobot categoriesRobot;

  // Screen Sizes
  static const _mobileSize = Size(350, 600);
  static const _tabletSize = Size(640, 800);
  static const _desktopSize = Size(1000, 1000);

  // Entry Point with Real App
  Future<ProviderContainer> pumpMyApp({
    List<Override> overrides = const [],
  }) async {
    final container = AppBootStrap().createFakeProviderContainer(
      overrides: overrides,
    );
    await _pumpAppWithContainer(const MyApp(), container);
    return container;
  }

  // Entry Point with Fake App (custom home + router)
  Future<void> pumpMyAppFake(Widget home, GoRouter router) async {
    final container = AppBootStrap().createFakeProviderContainer();
    final fakeApp = MyAppFake(home: home, router: router);
    await _pumpAppWithContainer(fakeApp, container);
  }

  // Internal shared pumping logic
  Future<void> _pumpAppWithContainer(
    Widget app,
    ProviderContainer container,
  ) async {
    final root = UncontrolledProviderScope(container: container, child: app);
    await tester.pumpWidget(root);
    await tester.pumpAndSettle();
  }

  // Set screen size before pumping app
  Future<void> _pumpWithScreenSize(
    Size screenSize,
    Future<void> Function() pumpApp,
  ) async {
    tester.view.physicalSize = screenSize;
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    await pumpApp();
  }

  // Real app with screen sizes
  Future<void> pumpAppWithMobileScreen() async =>
      _pumpWithScreenSize(_mobileSize, pumpMyApp);
  Future<void> pumpAppWithTabletScreen() async =>
      _pumpWithScreenSize(_tabletSize, pumpMyApp);
  Future<void> pumpAppWithDesktopScreen() async =>
      _pumpWithScreenSize(_desktopSize, pumpMyApp);

  // Fake app with screen sizes
  Future<void> pumpMyAppFakeWithMobileScreen(Widget home, GoRouter router) =>
      _pumpWithScreenSize(_mobileSize, () => pumpMyAppFake(home, router));

  Future<void> pumpMyAppFakeWithTabletScreen(Widget home, GoRouter router) =>
      _pumpWithScreenSize(_tabletSize, () => pumpMyAppFake(home, router));

  Future<void> pumpMyAppFakeWithDesktopScreen(Widget home, GoRouter router) =>
      _pumpWithScreenSize(_desktopSize, () => pumpMyAppFake(home, router));
}

class MyAppFake extends ConsumerWidget {
  const MyAppFake({super.key, required this.home, required this.router});

  final Widget home;
  final GoRouter router;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lightTheme = ref.watch(lightThemeProvider);

    return MaterialApp.router(
      routerConfig: router,
      restorationScopeId: 'app',
      debugShowCheckedModeBanner: false,
      supportedLocales: const [Locale('en', '')],
      theme: lightTheme,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      onGenerateTitle: (context) => context.loc.appTitle,
    );
  }
}
