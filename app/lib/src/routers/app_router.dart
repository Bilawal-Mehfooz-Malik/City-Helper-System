import 'package:app/src/core/common_widgets/custom_animated_screen.dart';
import 'package:app/src/core/common_widgets/custom_progress_indicator.dart';
import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/features/auth/presentation/account_screen.dart';
import 'package:app/src/features/auth/presentation/auth_flow_screen.dart';
import 'package:app/src/features/auth/presentation/delete_account_screen.dart';
import 'package:app/src/features/auth/presentation/profile_screen.dart';
import 'package:app/src/features/categories_list/presentation/categories_list_screen.dart';
import 'package:app/src/features/home/presentation/home_screen.dart';
import 'package:app/src/features/home/presentation/popular_entities_list_screen.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/features/home_detail/presentation/home_detail_screen.dart';
import 'package:app/src/features/home_detail/presentation/widgets/full_screen_photo_viewer.dart';
import 'package:app/src/features/my_shop/presentation/controllers/user_mode_controller.dart';
import 'package:app/src/features/my_shop/presentation/my_shop_dashboard_screen.dart';
import 'package:app/src/features/my_shop/presentation/shop_form_screen.dart';
import 'package:app/src/features/review/presentation/leave_review_screen.dart';
import 'package:app/src/features/review/presentation/review_list_screen.dart';
import 'package:app/src/core/common_widgets/pick_location_screen.dart';
import 'package:app/src/routers/json_extra_codec.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app/src/features/startup/data/real/user_location_repository.dart';
import 'package:app/src/features/startup/presentation/startup_screen.dart';
import 'package:app/src/routers/not_found_screen.dart';
import 'package:app/src/features/legal/presentation/terms_of_service_page.dart';
import 'package:app/src/features/legal/presentation/privacy_policy_page.dart';

part 'app_router.g.dart';

enum AppRoute {
  getStarted,
  termsOfService,
  privacyPolicy,
  pickYourLocation,
  category,
  home,
  homeDetail,
  popular,
  popularDetail,
  photoViewer,
  leaveReview,
  reviewList,
  auth,
  profile,
  account,
  myShop,
  shopForm,
  deleteAccount,
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

  // Refresh router on user mode change
  ref.listen(userModeControllerProvider, (_, _) => router.refresh());

  return router = GoRouter(
    initialLocation: initialLocation,
    debugLogDiagnostics: true,
    // redirect: (context, state) => redirection(ref, state),
    extraCodec: const JsonExtraCodec(),
    routes: [
      GoRoute(
        path: '/get-started',
        name: AppRoute.getStarted.name,
        builder: (context, state) => const StartupScreen(),
      ),
      GoRoute(
        path: '/terms-of-service',
        name: AppRoute.termsOfService.name,
        pageBuilder: (context, state) => MaterialPage(
          fullscreenDialog: true,
          child: const TermsOfServicePage(),
        ),
      ),
      GoRoute(
        path: '/privacy-policy',
        name: AppRoute.privacyPolicy.name,
        pageBuilder: (context, state) => MaterialPage(
          fullscreenDialog: true,
          child: const PrivacyPolicyPage(),
        ),
      ),
      GoRoute(
        path: '/delete-account',
        name: AppRoute.deleteAccount.name,
        builder: (context, state) => const DeleteAccountScreen(),
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
                  GoRoute(
                    path: 'reviews', // Path for ReviewListScreen
                    name: AppRoute.reviewList.name,
                    pageBuilder: (context, state) {
                      final entityId = state.pathParameters['entityId']!;
                      final categoryId = int.parse(
                        state.pathParameters['categoryId']!,
                      );
                      return MaterialPage(
                        fullscreenDialog: true,
                        child: ReviewListScreen(
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
        path: '/photo-viewer',
        name: AppRoute.photoViewer.name,
        pageBuilder: (context, state) {
          final Map<String, dynamic> data = state.extra as Map<String, dynamic>;
          final List<String> images = data['images'] as List<String>;
          final int initialIndex = data['initialIndex'] as int;
          return MaterialPage(
            fullscreenDialog: true,
            child: FullscreenPhotoViewer(
              images: images,
              initialIndex: initialIndex,
            ),
          );
        },
      ),
      GoRoute(
        path: '/pick-your-location',
        name: AppRoute.pickYourLocation.name,
        pageBuilder: (context, state) => CustomAnimatedScreen(
          child: PickLocationScreen(),
          transitionType: .slide,
        ),
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
