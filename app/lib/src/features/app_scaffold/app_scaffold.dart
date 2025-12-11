import 'package:app/src/core/utils/screen_utils.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/app_scaffold/navigation_rail_controller.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:app/src/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppScaffold extends ConsumerWidget {
  final Widget child;
  const AppScaffold({super.key, required this.child});

  int _calculateIndex(BuildContext context) {
    final state = GoRouterState.of(context);

    if (state.matchedLocation.contains(AppScaffoldRoutes.favorites.name)) {
      return 1;
    } else if (state.matchedLocation.contains(AppScaffoldRoutes.account.name)) {
      return 2;
    } else {
      return 0;
    }
  }

  void _onTapNavItem(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.goNamed(AppScaffoldRoutes.explore.name);
        break;
      case 1:
        context.goNamed(AppScaffoldRoutes.favorites.name);
        break;
      case 2:
        context.goNamed(AppScaffoldRoutes.account.name);
        break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = _calculateIndex(context);
    final isSmall = isMobileScreen(context);

    final titles = [
      'Explore'.hardcoded,
      'Favorites'.hardcoded,
      'Account'.hardcoded,
    ];

    return Scaffold(
      appBar: isSmall
          ? AppBar(
              titleTextStyle: context.textTheme.titleLarge?.copyWith(
                fontWeight: .bold,
              ),
              surfaceTintColor: Colors.transparent,
              title: Text(titles[selectedIndex]),
              backgroundColor: context.colorScheme.surfaceContainer,
            )
          : null,
      body: isSmall
          ? child
          : _buildNavigationRailAndRightSection(selectedIndex, context),
      bottomNavigationBar: isSmall
          ? _buildBottomNavBar(selectedIndex, context)
          : null,
    );
  }

  Row _buildNavigationRailAndRightSection(
    int selectedIndex,
    BuildContext context,
  ) {
    return Row(
      children: [
        Consumer(
          builder: (context, ref, _) {
            final isDrawerOpen = ref.watch(navigationRailControllerProvider);
            return NavigationRail(
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) => _onTapNavItem(index, context),
              leading: IconButton(
                icon: Icon(isDrawerOpen ? Icons.close : Icons.menu),
                onPressed: () => ref
                    .read(navigationRailControllerProvider.notifier)
                    .toggle(),
              ),
              extended: isDrawerOpen,
              minExtendedWidth: 180,
              unselectedLabelTextStyle: context.textTheme.bodyMedium,
              selectedLabelTextStyle: context.textTheme.bodyMedium?.copyWith(
                fontWeight: .w600,
              ),
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.explore_outlined),
                  selectedIcon: Icon(Icons.explore),
                  label: Text('Explore'.hardcoded),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.favorite_border),
                  selectedIcon: Icon(Icons.favorite),
                  label: Text('Favorites'.hardcoded),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.person_outline),
                  selectedIcon: Icon(Icons.person),
                  label: Text('Account'.hardcoded),
                ),
              ],
            );
          },
        ),
        VerticalDivider(thickness: 0.5, width: 1),
        Expanded(child: child),
      ],
    );
  }

  NavigationBar _buildBottomNavBar(int selectedIndex, BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) => _onTapNavItem(index, context),
      destinations: [
        NavigationDestination(
          icon: Icon(Icons.explore_outlined),
          selectedIcon: Icon(Icons.explore),
          label: 'Explore'.hardcoded,
        ),
        NavigationDestination(
          icon: Icon(Icons.favorite_border),
          selectedIcon: Icon(Icons.favorite),
          label: 'Favorites'.hardcoded,
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: 'Account'.hardcoded,
        ),
      ],
    );
  }
}
