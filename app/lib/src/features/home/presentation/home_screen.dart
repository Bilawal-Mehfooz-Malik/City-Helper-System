import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/error_message_formatter.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home/application/entity_service.dart';
import 'package:app/src/features/home/data/real/ads_carousel_repository.dart';
import 'package:app/src/features/home/data/real/sub_categories_repository.dart';
import 'package:app/src/features/home/presentation/carousel_ads_list.dart';
import 'package:app/src/features/home/presentation/controllers/home_error_notification_controller.dart';
import 'package:app/src/features/home/presentation/controllers/subcategory_controller.dart';
import 'package:app/src/features/home/presentation/entities_list_section.dart';
import 'package:app/src/features/home/domain/home_section_identifier.dart';
import 'package:app/src/features/home/presentation/popular_entities_section.dart';
import 'package:app/src/features/home/presentation/sub_categories_list.dart';
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

  /// Triggers a refresh of all data providers for the home screen.
  Future<void> _onRefresh(WidgetRef ref) async {
    ref.invalidate(subcategoryControllerProvider);
    // Also clear any tracked failures
    ref
        .read(homeErrorNotificationControllerProvider.notifier)
        .clearFailedSections();

    await Future.wait([
      ref.refresh(subCategoriesListStreamProvider(categoryId).future),
      ref.refresh(adsListFutureProvider(categoryId).future),
      ref.refresh(WatchPopularEntitiesProvider(categoryId, null).future),
      ref.refresh(WatchEntitiesProvider(categoryId, null).future),
    ]);
  }

  /// Triggers a selective refresh of only the providers that have failed.
  Future<void> _onRetry(WidgetRef ref) async {
    final state = ref.read(homeErrorNotificationControllerProvider);
    final subCategory = ref.read(subcategoryControllerProvider);

    final futures = <Future<void>>[
      for (final sectionIdentifier in state.failedSections)
        switch (sectionIdentifier) {
          HomeSectionIdentifier.subcategories => ref.refresh(
            subCategoriesListStreamProvider(categoryId).future,
          ),
          HomeSectionIdentifier.ads => ref.refresh(
            adsListFutureProvider(categoryId).future,
          ),
          HomeSectionIdentifier.popular => ref.refresh(
            WatchPopularEntitiesProvider(categoryId, subCategory).future,
          ),
          HomeSectionIdentifier.entities => ref.refresh(
            WatchEntitiesProvider(categoryId, subCategory).future,
          ),
        },
    ];

    // Clear the failures before retrying
    ref
        .read(homeErrorNotificationControllerProvider.notifier)
        .clearFailedSections();

    await Future.wait(futures);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listener for the error notification banner
    ref.listen<
      ({Set<HomeSectionIdentifier> failedSections, Object? lastError})
    >(homeErrorNotificationControllerProvider, (previous, state) {
      if (state.failedSections.isNotEmpty) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(formatErrorMessage(state.lastError!)),
            duration: const Duration(days: 365), // Make it effectively infinite
            action: SnackBarAction(
              label: context.loc.retry,
              onPressed: () => _onRetry(ref),
            ),
          ),
        );
      } else {
        // If there are no more failed sections, dismiss the snackbar
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      }
    });

    return Scaffold(
      body: SafeArea(
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
