import 'package:app/src/features/home/application/popular_entities_paginated_provider.dart';
import 'package:app/src/core/common_widgets/empty_message_widget.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home/application/entity_service.dart';
import 'package:app/src/features/home/data/real/ads_carousel_repository.dart';
import 'package:app/src/features/home/data/real/sub_categories_repository.dart';
import 'package:app/src/features/home/presentation/controllers/home_error_controller.dart';
import 'package:app/src/features/home/presentation/controllers/subcategory_controller.dart';
import 'package:app/src/features/home/presentation/entities_list_section.dart';
import 'package:app/src/features/home/presentation/carousel_ads_list.dart';
import 'package:app/src/features/home/presentation/sub_categories_list.dart';
import 'package:app/src/features/home/presentation/popular_entities_section.dart';
import 'package:app/src/features/home/presentation/widgets/home_search_bar.dart';
import 'package:app/src/features/home/presentation/widgets/persistent_error_bar.dart';
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

  Future<void> _onRefresh(WidgetRef ref) async {
    ref.invalidate(subcategoryControllerProvider);
    ref.invalidate(popularEntitiesNotifierProvider(categoryId));

    await Future.wait([
      ref.refresh(subCategoriesListStreamProvider(categoryId).future),
      ref.refresh(adsListFutureProvider(categoryId).future),
      ref.refresh(WatchEntitiesProvider(categoryId, null).future),
    ]);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final criticalError = ref.watch(
      criticalErrorStatusProvider(categoryId: categoryId),
    );
    final nonCriticalErrors = ref.watch(
      nonCriticalErrorsProvider(categoryId: categoryId),
    );

    return Scaffold(
      body: SafeArea(
        child: criticalError != null
            ? CenteredMessageWidget(
                message: context.loc.somethingWentWrongTryAgain,
              )
            : Stack(
                children: [
                  RefreshIndicator(
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
                          surfaceTintColor:
                              context.theme.scaffoldBackgroundColor,
                          backgroundColor:
                              context.theme.scaffoldBackgroundColor,
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
                  if (nonCriticalErrors.isNotEmpty)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: PersistentErrorBar(
                        message: nonCriticalErrors.first,
                        onRetry: () => _onRefresh(ref),
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}
