import 'package:app/src/core/utils/screen_utils.dart';
import 'package:app/src/core/common_widgets/custom_text_button.dart';
import 'package:app/src/core/common_widgets/section_header.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/categories_list/presentation/controllers/selected_category_view_controller.dart';
import 'package:app/src/features/home/domain/entities_pagination_state.dart';
import 'package:app/src/features/home/domain/entity.dart';
import 'package:app/src/features/home/presentation/controllers/list_type_controller.dart';
import 'package:app/src/features/home/presentation/controllers/filter_context.dart';
import 'package:app/src/features/home/presentation/controllers/filter_controller.dart';
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
      ref
          .read(popularEntitiesNotifierProvider(widget.categoryId).notifier)
          .fetchNextPage();
    }
  }

  void _goToDetails(BuildContext context, WidgetRef ref, Entity entity) {
    final screenType = screenTypeOf(context);

    if (screenType == ScreenType.tablet || screenType == ScreenType.desktop) {
      context.pushNamed(
        AppRoute.homeDetail.name,
        pathParameters: {
          'categoryId': widget.categoryId.toString(),
          'entityId': entity.id,
        },
      );
    } else {
      context.pushNamed(
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
        .read(
          filterControllerProvider(
            categoryId: widget.categoryId,
            filterContext: FilterContext.popular,
          ).notifier,
        )
        .resetFilters();
    final screenType = screenTypeOf(context);

    if (screenType == ScreenType.tablet || screenType == ScreenType.desktop) {
      // Use a state provider to indicate the "popular" view should be shown
      ref
          .read(selectedCategoryViewControllerProvider.notifier)
          .setSelectedCategoryView(SelectedCategoryView.popular);
    } else {
      context.pushNamed(
        AppRoute.popular.name,
        pathParameters: {'categoryId': widget.categoryId.toString()},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final popularEntitiesState = ref.watch(
      popularEntitiesNotifierProvider(widget.categoryId),
    );
    final entities = popularEntitiesState.entities;

    return _PopularEntitiesContent(
      popularEntitiesState: popularEntitiesState,
      entities: entities,
      categoryId: widget.categoryId,
      scrollController: _scrollController,
      goToDetails: _goToDetails,
      onSeeAllPressed: _onSeeAllPressed,
    );
  }
}

class _PopularEntitiesContent extends ConsumerWidget {
  const _PopularEntitiesContent({
    required this.popularEntitiesState,
    required this.entities,
    required this.categoryId,
    required this.scrollController,
    required this.goToDetails,
    required this.onSeeAllPressed,
  });

  final EntitiesPaginatedState popularEntitiesState;
  final List<Entity> entities;
  final CategoryId categoryId;
  final ScrollController scrollController;
  final void Function(BuildContext, WidgetRef, Entity) goToDetails;
  final void Function(BuildContext, WidgetRef) onSeeAllPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            onPressed: () => onSeeAllPressed(context, ref),
            text: context.loc.seeAll,
          ),
        ),
        _PopularEntitiesHorizontalList(
          entities: entities,
          popularEntitiesState: popularEntitiesState,
          scrollController: scrollController,
          categoryId: categoryId,
          goToDetails: goToDetails,
        ),
      ],
    );
  }
}

class _PopularEntitiesHorizontalList extends ConsumerWidget {
  const _PopularEntitiesHorizontalList({
    required this.entities,
    required this.popularEntitiesState,
    required this.scrollController,
    required this.categoryId,
    required this.goToDetails,
  });

  final List<Entity> entities;
  final EntitiesPaginatedState popularEntitiesState;
  final ScrollController scrollController;
  final CategoryId categoryId;
  final void Function(BuildContext, WidgetRef, Entity) goToDetails;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: entities.isNotEmpty && entities.first is Residence ? 300 : 275,
      child: ListView.builder(
        controller: scrollController,
        itemExtent: 280,
        shrinkWrap: true,
        itemCount:
            entities.length +
            (popularEntitiesState.isLoadingNextPage ? 4 : 0) +
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
                      .read(
                        popularEntitiesNotifierProvider(categoryId).notifier,
                      )
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
              onTap: () => goToDetails(context, ref, entity),
            ),
          );
        },
      ),
    );
  }
}
