import 'package:app/src/features/home/application/popular_entities_paginated_provider.dart';
import 'package:app/src/core/common_widgets/section_header.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/categories_list/domain/categories_exception.dart';
import 'package:app/src/features/categories_list/presentation/controllers/selected_category_view_controller.dart';
import 'package:app/src/features/home/domain/entity.dart';
import 'package:app/src/features/home/presentation/controllers/filter_controller.dart';
import 'package:app/src/features/home/presentation/controllers/list_type_controller.dart';
import 'package:app/src/features/home/presentation/home_skeletons.dart';
import 'package:app/src/features/home/presentation/widgets/entities_grid_layout.dart';
import 'package:app/src/features/home/presentation/widgets/entity_card.dart';
import 'package:app/src/features/home/presentation/widgets/filter_dialog.dart';
import 'package:app/src/features/home_detail/presentation/controllers/popular_detail_view_controller.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PopularEntitiesListScreen extends ConsumerStatefulWidget {
  final bool isPushed;
  final CategoryId categoryId;
  const PopularEntitiesListScreen({
    super.key,
    this.isPushed = true,
    required this.categoryId,
  });

  @override
  ConsumerState<PopularEntitiesListScreen> createState() =>
      _PopularEntitiesListScreenState();
}

class _PopularEntitiesListScreenState
    extends ConsumerState<PopularEntitiesListScreen> {
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
    ref.read(popularDetailViewControllerProvider.notifier).setPopularView(true);

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
        AppRoute.popularDetail.name,
        pathParameters: {
          'categoryId': entity.categoryId.toString(),
          'entityId': entity.id,
        },
      );
    }
  }

  void _showFilterDialog(BuildContext context, WidgetRef ref) {
    showDialog<void>(
      context: context,
      builder: (_) => FilterDialog(categoryId: widget.categoryId),
    );
  }

  void _onBack(BuildContext context, WidgetRef ref) {
    ref
        .read(listTypeControllerProvider.notifier)
        .updateListType(HomeListType.all);
    ref
        .read(popularDetailViewControllerProvider.notifier)
        .setPopularView(false);

    ref
        .read(filterControllerProvider(categoryId: widget.categoryId).notifier)
        .resetFilters();
    if (widget.isPushed) {
      context.pop();
    } else {
      ref
          .read(selectedCategoryViewControllerProvider.notifier)
          .setSelectedCategoryView(SelectedCategoryView.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    final popularEntitiesState = ref.watch(
      popularEntitiesNotifierProvider(widget.categoryId),
    );
    final entities = popularEntitiesState.entities;

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          _onBack(context, ref);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: context.theme.scaffoldBackgroundColor,
          backgroundColor: context.theme.scaffoldBackgroundColor,
          leading: BackButton(onPressed: () => _onBack(context, ref)),
          title: Text(
            context.loc.popular,
            style: context.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: SectionHeader(
                  startWidget: Text(
                    context.loc.filtersTitle,
                    style: context.textTheme.titleLarge,
                  ),
                  endWidget: IconButton(
                    icon: const Icon(Icons.filter_list_alt),
                    onPressed: () => _showFilterDialog(context, ref),
                  ),
                ),
              ),
              sliverGapH8,
              if (entities.isEmpty &&
                  popularEntitiesState.paginationError != null)
                SliverFillRemaining(
                  child: Center(child: Text(context.loc.anErrorOccurred)),
                )
              else if (entities.isEmpty && !popularEntitiesState.hasMore)
                SliverFillRemaining(
                  child: Center(child: Text(NoEntityFoundException().message)),
                )
              else if (entities.isEmpty)
                const SliverFillRemaining(child: EntitiesListSkeleton())
              else
                SliverToBoxAdapter(
                  child: EntitiesGridLayout(
                    shrinkWrap: true,
                    itemCount: entities.length,
                    itemBuilder: (_, index) {
                      final entity = entities[index];
                      return EntityCard(
                        entity: entity,
                        useElipsis: false,
                        onTap: () => _goToDetails(context, ref, entity),
                      );
                    },
                    emptyMessage: NoEntityFoundException().message,
                  ),
                ),
              if (popularEntitiesState.isLoadingNextPage)
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(Sizes.p16),
                    child: Center(child: EntitiesListSkeleton()),
                  ),
                ),
              if (popularEntitiesState.paginationError != null &&
                  entities.isNotEmpty)
                SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(Sizes.p16),
                      child: Column(
                        children: [
                          Text(
                            context.loc.failedToLoadItems,
                            style: context.textTheme.bodySmall?.copyWith(
                              color: context.theme.colorScheme.error,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              ref
                                  .read(
                                    popularEntitiesNotifierProvider(
                                      widget.categoryId,
                                    ).notifier,
                                  )
                                  .fetchNextPage();
                            },
                            child: Text(context.loc.retry),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
