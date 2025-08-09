import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home/application/entity_service.dart';
import 'package:app/src/features/home/data/real/ads_carousel_repository.dart';
import 'package:app/src/features/home/data/real/sub_categories_repository.dart';
import 'package:app/src/features/home/presentation/controllers/home_error_notification_controller.dart';
import 'package:app/src/features/home/presentation/controllers/subcategory_controller.dart';
import 'package:app/src/features/home/presentation/entities_list_section.dart';
import 'package:app/src/features/home/presentation/carousel_ads_list.dart';
import 'package:app/src/features/home/presentation/sub_categories_list.dart';
import 'package:app/src/features/home/presentation/popular_entities_section.dart';
import 'package:app/src/features/home/presentation/widgets/home_search_bar.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  final bool showBackButton;
  final CategoryId categoryId;
  const HomeScreen({
    super.key,
    required this.categoryId,
    this.showBackButton = true,
  });

  // THIS IS THE NEW REFRESH HANDLER
  /// Triggers a refresh of all data providers for the home screen.
  /// - Resets the subcategory filter.
  /// - Re-fetches ads, subcategories, popular items, and all entities.
  /// - The RefreshIndicator will wait for the returned Future to complete.
  Future<void> _onRefresh(WidgetRef ref) async {
    // Invalidate state controllers to reset filters to their default state.
    ref.invalidate(subcategoryControllerProvider);

    // Refresh all the primary data sources for this screen by calling ref.refresh.
    // We use Future.wait to run them in parallel and wait for all to finish.
    await Future.wait([
      // Use .future to get a future from the stream provider that completes
      // with the first value.
      ref.refresh(subCategoriesListStreamProvider(categoryId).future),
      ref.refresh(adsListFutureProvider(categoryId).future),
      // Since the subcategory controller was invalidated, its state is now null,
      // so we refresh the providers for the "All" view.
      ref.refresh(WatchPopularEntitiesProvider(categoryId, null).future),
      ref.refresh(WatchEntitiesProvider(categoryId, null).future),
    ]);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listener for the error notification banner
    ref.listen<bool>(homeErrorNotificationControllerProvider, (previous, next) {
      if (next) {
        // Hide any existing snackbars
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        // Show the new error snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.loc.somethingWentWrongTryAgain),
            duration: const Duration(seconds: 5), // Keep it visible
            action: SnackBarAction(
              label: context.loc.retry,
              onPressed: () async {
                // When retry is pressed, clear the error and refresh the data
                ref
                    .read(homeErrorNotificationControllerProvider.notifier)
                    .clearError();
                await _onRefresh(ref);
              },
            ),
          ),
        );
      }
    });

    return Scaffold(
      body: SafeArea(
        // The RefreshIndicator is kept for the pull-to-refresh gesture
        child: RefreshIndicator(
          onRefresh: () => _onRefresh(ref),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                snap: true,
                elevation: 0,
                floating: true,
                titleSpacing: 0,
                forceElevated: false,
                automaticallyImplyLeading: false,
                toolbarHeight: kToolbarHeight + Sizes.p12,
                surfaceTintColor: context.theme.scaffoldBackgroundColor,
                backgroundColor: context.theme.scaffoldBackgroundColor,
                title: HomeSearchBar(
                  showBackButton: showBackButton,
                  categoryId: categoryId,
                ),
              ),
              sliverGapH8,
              SliverToBoxAdapter(
                child: SubCategoriesList(categoryId: categoryId),
              ),
              sliverGapH8,
              SliverToBoxAdapter(
                child: CarouselAdsList(categoryId: categoryId),
              ),
              SliverToBoxAdapter(
                child: PopularEnitiesSection(categoryId: categoryId),
              ),
              sliverGapH8,
              SliverToBoxAdapter(
                child: EntitiesListSection(categoryId: categoryId),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
