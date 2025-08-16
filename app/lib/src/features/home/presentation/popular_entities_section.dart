import 'package:app/src/features/home/application/popular_entities_paginated_provider.dart';
import 'package:app/src/core/common_widgets/custom_text_button.dart';
import 'package:app/src/core/common_widgets/section_header.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/categories_list/presentation/controllers/selected_category_view_controller.dart';
import 'package:app/src/features/home/domain/entity.dart';
import 'package:app/src/features/home/presentation/controllers/filter_controller.dart';
import 'package:app/src/features/home/presentation/controllers/list_type_controller.dart';
import 'package:app/src/features/home/presentation/home_skeletons.dart';
import 'package:app/src/features/home/presentation/widgets/entity_card.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PopularEnitiesSection extends ConsumerStatefulWidget {
  final CategoryId categoryId;
  const PopularEnitiesSection({super.key, required this.categoryId});

  @override
  ConsumerState<PopularEnitiesSection> createState() =>
      _PopularEnitiesSectionState();
}

class _PopularEnitiesSectionState extends ConsumerState<PopularEnitiesSection> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      ref.read(popularEntitiesNotifierProvider(widget.categoryId).notifier).fetchNextPage();
    }
  }

  void _goToDetails(BuildContext context, WidgetRef ref, Entity entity) {
    final screenSize = MediaQuery.sizeOf(context);
    final screenType = ScreenType.determine(
      width: screenSize.width,
      height: screenSize.height,
    );

    if (screenType == ScreenType.tablet || screenType == ScreenType.desktop) {
      context.pushNamed(
        AppRoute.homeDetail.name,
        pathParameters: {
          'categoryId': widget.categoryId.toString(),
          'entityId': entity.id,
        },
      );
    } else {
      context.goNamed(
        AppRoute.homeDetail.name,
        pathParameters: {
          'categoryId': entity.categoryId.toString(),
          'entityId': entity.id,
        },
      );
    }
  }

  void _onSeeAllPressed(BuildContext context, WidgetRef ref) {
    ref
        .read(listTypeControllerProvider.notifier)
        .updateListType(HomeListType.popular);
    ref
        .read(filterControllerProvider(categoryId: widget.categoryId).notifier)
        .resetFilters();
    final screenSize = MediaQuery.sizeOf(context);
    final screenType = ScreenType.determine(
      width: screenSize.width,
      height: screenSize.height,
    );

    if (screenType == ScreenType.tablet || screenType == ScreenType.desktop) {
      // Use a state provider to indicate the "popular" view should be shown
      ref
          .read(selectedCategoryViewControllerProvider.notifier)
          .setSelectedCategoryView(SelectedCategoryView.popular);
    } else {
      context.goNamed(
        AppRoute.popular.name,
        pathParameters: {'categoryId': widget.categoryId.toString()},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final popularEntitiesState = ref.watch(popularEntitiesNotifierProvider(widget.categoryId));
    final entities = popularEntitiesState.entities;

    // Handle initial error state
    if (entities.isEmpty && popularEntitiesState.paginationError != null) {
      return const SizedBox.shrink();
    }

    // Handle empty state after fetch
    if (entities.isEmpty && !popularEntitiesState.hasMore) {
      return const SizedBox.shrink();
    }

    // Show skeleton if loading for the first time
    if (entities.isEmpty) {
      return const PopularEntitesSkeletonList();
    }

    return Column(
      spacing: Sizes.p4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          startWidget: Text(
            context.loc.popular,
            style: context.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          endWidget: CustomTextButton(
            onPressed: () => _onSeeAllPressed(context, ref),
            text: context.loc.seeAll,
          ),
        ),
        SizedBox(
          height: entities.isNotEmpty && entities.first is Residence
              ? 300
              : 275,
          child: ListView.builder(
            controller: _scrollController,
            itemExtent: 280,
            shrinkWrap: true,
            itemCount:
                entities.length +
                (popularEntitiesState.isLoadingNextPage ? 3 : 0) +
                (popularEntitiesState.paginationError != null ? 1 : 0),
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
            itemBuilder: (_, index) {
              if (index >= entities.length) {
                // If we have a pagination error, show the error widget at the end
                if (popularEntitiesState.paginationError != null) {
                  return Center(
                    child: ElevatedButton(
                      onPressed: () => ref
                          .read(popularEntitiesNotifierProvider(widget.categoryId).notifier)
                          .fetchNextPage(),
                      child: Text(context.loc.retry),
                    ),
                  );
                }
                // Otherwise, show the loading skeleton
                return EntityCardSkeleton(allBorders: false);
              }
              final entity = entities[index];
              return Card(
                margin: const EdgeInsets.only(
                  right: Sizes.p8,
                  top: Sizes.p4,
                  bottom: Sizes.p4,
                ),
                child: EntityCard(
                  entity: entity,
                  allBorders: false,
                  onTap: () => _goToDetails(context, ref, entity),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
