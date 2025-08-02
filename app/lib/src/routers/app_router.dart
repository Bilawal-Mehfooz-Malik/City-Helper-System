import 'package:app/src/core/common_widgets/custom_progress_indicator.dart';
import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/features/auth/presentation/account_screen.dart';
import 'package:app/src/features/auth/presentation/auth_flow_screen.dart';
import 'package:app/src/features/auth/presentation/profile_screen.dart';
import 'package:app/src/features/categories_list/presentation/categories_list_screen.dart';
import 'package:app/src/features/home/presentation/home_screen.dart';
import 'package:app/src/features/home/presentation/popular_entities_list_screen.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/features/home_detail/presentation/home_detail_screen.dart';
import 'package:app/src/features/my_shop/presentation/my_shop_dashboard_screen.dart';
import 'package:app/src/features/my_shop/presentation/shop_form_screen.dart';
import 'package:app/src/features/review/presentation/leave_review_screen.dart';
import 'package:app/src/routers/redirection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app/src/features/startup/data/real/user_location_repository.dart';
import 'package:app/src/features/startup/presentation/pick_location_screen.dart';
import 'package:app/src/features/startup/presentation/startup_screen.dart';
import 'package:app/src/routers/not_found_screen.dart';

part 'app_router.g.dart';

enum AppRoute {
  getStarted,
  pickYourLocation,
  category,
  home,
  homeDetail,
  popular,
  popularDetail,
  leaveReview,
  auth,
  profile,
  account,
  myShop,
  shopForm,
  loading,
  pageNotFound,
}

@riverpod
GoRouter appRouter(Ref ref) {
  late GoRouter router;
  // Determine the initial route based on the user location state.
  final userLocation = ref.watch(fetchUserLocationProvider).value;
  final initialLocation = userLocation != null ? '/' : '/get-started';

  // listen for changes in userLocationProvider to refresh the router for redirection
  ref.listen(fetchUserLocationProvider, (_, _) => router.refresh());

  // Refresh router on auth state change
  ref.listen(authStateChangesProvider, (_, _) => router.refresh());

  return router = GoRouter(
    initialLocation: initialLocation,
    debugLogDiagnostics: true,
    redirect: (context, state) => redirection(ref, state),
    routes: [
      GoRoute(
        path: '/get-started',
        name: AppRoute.getStarted.name,
        builder: (context, state) => const StartupScreen(),
        routes: [
          GoRoute(
            path: 'pick-your-location',
            name: AppRoute.pickYourLocation.name,
            pageBuilder: (context, state) {
              return const MaterialPage(
                fullscreenDialog: true,
                child: PickLocationScreen(),
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: '/',
        name: AppRoute.category.name,
        builder: (context, state) => const CategoriesListScreen(),
        routes: [
          GoRoute(
            path: '/home/:categoryId',
            name: AppRoute.home.name,
            builder: (context, state) {
              final id = int.parse(state.pathParameters['categoryId']!);
              return HomeScreen(categoryId: id);
            },
            routes: [
              GoRoute(
                path: 'popular',
                name: AppRoute.popular.name,
                builder: (context, state) {
                  final id = int.parse(state.pathParameters['categoryId']!);
                  return PopularEntitiesListScreen(categoryId: id);
                },
                routes: [
                  GoRoute(
                    path: 'detail/:entityId',
                    name: AppRoute.popularDetail.name,
                    pageBuilder: (context, state) {
                      final categoryId = int.parse(
                        state.pathParameters['categoryId']!,
                      );
                      final entityId = state.pathParameters['entityId']!;
                      return MaterialPage(
                        fullscreenDialog: true,
                        child: HomeDetailScreen(
                          categoryId: categoryId,
                          entityId: entityId,
                        ),
                      );
                    },
                  ),
                ],
              ),
              GoRoute(
                path: 'detail/:entityId',
                name: AppRoute.homeDetail.name,
                pageBuilder: (context, state) {
                  final categoryId = int.parse(
                    state.pathParameters['categoryId']!,
                  );
                  final entityId = state.pathParameters['entityId']!;
                  return MaterialPage(
                    fullscreenDialog: true,
                    child: HomeDetailScreen(
                      categoryId: categoryId,
                      entityId: entityId,
                    ),
                  );
                },
                routes: [
                  GoRoute(
                    path: 'leave-review',
                    name: AppRoute.leaveReview.name,
                    pageBuilder: (context, state) {
                      final entityId = state.pathParameters['entityId']!;
                      final categoryId = int.parse(
                        state.pathParameters['categoryId']!,
                      );
                      return MaterialPage(
                        fullscreenDialog: true,
                        child: LeaveReviewScreen(
                          entityId: entityId,
                          categoryId: categoryId,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: 'auth',
            name: AppRoute.auth.name,
            pageBuilder: (context, state) =>
                MaterialPage(fullscreenDialog: true, child: AuthFlowScreen()),
          ),
          GoRoute(
            path: 'account',
            name: AppRoute.account.name,
            pageBuilder: (context, state) =>
                MaterialPage(fullscreenDialog: true, child: AccountScreen()),
          ),
          GoRoute(
            path: 'profile',
            name: AppRoute.profile.name,
            pageBuilder: (context, state) =>
                MaterialPage(fullscreenDialog: true, child: ProfileScreen()),
          ),
        ],
      ),
      GoRoute(
        path: '/my-shop',
        name: AppRoute.myShop.name,
        builder: (context, state) => MyShopDashboardScreen(),
        routes: [
          GoRoute(
            path: '/shop-form',
            name: AppRoute.shopForm.name,
            builder: (context, state) {
              final shop = state.extra as EntityDetail?;
              return ShopFormScreen(initialShop: shop);
            },
          ),
        ],
      ),
      GoRoute(
        path: '/loading',
        name: AppRoute.loading.name,
        builder: (context, state) => const LoadingScreen(),
      ),
      GoRoute(
        path: '/page-not-found',
        name: AppRoute.pageNotFound.name,
        builder: (context, state) => const NotFoundScreen(),
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
