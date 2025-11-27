import 'package:app/src/core/common_widgets/empty_message_widget.dart';
import 'package:app/src/core/common_widgets/section_header.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/screen_utils.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/categories_list/domain/categories_exception.dart';
import 'package:app/src/features/categories_list/presentation/controllers/selected_category_view_controller.dart';
import 'package:app/src/features/home/domain/entities_pagination_state.dart';
import 'package:app/src/features/home/domain/entity.dart';
import 'package:app/src/features/home/presentation/controllers/filter_context.dart';
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
      builder: (_) => FilterDialog(
        categoryId: widget.categoryId,
        filterContext: FilterContext.popular,
      ),
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
        .read(
          filterControllerProvider(
            categoryId: widget.categoryId,
            filterContext: FilterContext.popular,
          ).notifier,
        )
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
        appBar: _PopularEntitiesListAppBar(onBack: () => _onBack(context, ref)),
        body: SafeArea(
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: _PopularEntitiesListFilterHeader(
                  onShowFilterDialog: () => _showFilterDialog(context, ref),
                  categoryId: widget.categoryId,
                ),
              ),
              sliverGapH8,
              _PopularEntitiesListMainContent(
                popularEntitiesState: popularEntitiesState,
                entities: entities,
                categoryId: widget.categoryId,
                onGoToDetails: _goToDetails,
              ),
              if (popularEntitiesState.paginationError != null &&
                  entities.isNotEmpty)
                _PopularEntitiesListPaginationError(
                  categoryId: widget.categoryId,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// New widget for AppBar
class _PopularEntitiesListAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _PopularEntitiesListAppBar({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: context.theme.scaffoldBackgroundColor,
      backgroundColor: context.theme.scaffoldBackgroundColor,
      leading: BackButton(onPressed: onBack),
      title: Text(
        context.loc.popular,
        style: context.textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// New widget for Filter Header
class _PopularEntitiesListFilterHeader extends ConsumerWidget {
  const _PopularEntitiesListFilterHeader({
    required this.onShowFilterDialog,
    required this.categoryId,
  });

  final VoidCallback onShowFilterDialog;
  final CategoryId categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SectionHeader(
      startWidget: Text(
        context.loc.filtersTitle,
        style: context.textTheme.titleLarge,
      ),
      endWidget: IconButton(
        icon: const Icon(Icons.filter_list_alt),
        onPressed: onShowFilterDialog,
      ),
    );
  }
}

// New widget for critical error state
class _PopularEntitiesListErrorState extends StatelessWidget {
  const _PopularEntitiesListErrorState();

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: CenteredMessageWidget(
        useResponsiveDesign: false,
        message: context.loc.anErrorOccurred,
      ),
    );
  }
}

// New widget for no entities found state
class _PopularEntitiesListEmptyState extends StatelessWidget {
  const _PopularEntitiesListEmptyState();

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: CenteredMessageWidget(
        useResponsiveDesign: false,
        message: NoEntityFoundException().message,
      ),
    );
  }
}

// New widget for initial loading skeleton
class _PopularEntitiesListInitialLoading extends StatelessWidget {
  const _PopularEntitiesListInitialLoading();

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(child: EntitiesListSkeleton());
  }
}

// New widget for the entities grid display
class _PopularEntitiesListGrid extends ConsumerWidget {
  const _PopularEntitiesListGrid({
    required this.entities,
    required this.popularEntitiesState,
    required this.onGoToDetails,
  });

  final List<Entity> entities;
  final EntitiesPaginatedState popularEntitiesState;
  final void Function(BuildContext, WidgetRef, Entity) onGoToDetails;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: EntitiesGridLayout(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount:
            entities.length + (popularEntitiesState.isLoadingNextPage ? 4 : 0),
        itemBuilder: (_, index) {
          if (index < entities.length) {
            final entity = entities[index];
            return EntityCard(
              entity: entity,
              useElipsis: false,
              onTap: () => onGoToDetails(context, ref, entity),
            );
          }
          return const EntityCardSkeleton(allBorders: true);
        },
        emptyMessage: NoEntityFoundException().message,
      ),
    );
  }
}

// New widget for pagination error
class _PopularEntitiesListPaginationError extends ConsumerWidget {
  const _PopularEntitiesListPaginationError({required this.categoryId});

  final CategoryId categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: CenteredMessageWidget(
        useResponsiveDesign: false,
        message: context.loc.failedToLoadItems,
        actions: ElevatedButton(
          onPressed: () => ref
              .read(popularEntitiesNotifierProvider(categoryId).notifier)
              .fetchNextPage(),
          child: Text(context.loc.retry),
        ),
      ),
    );
  }
}

// Main content widget that handles conditional rendering for the list screen
class _PopularEntitiesListMainContent extends ConsumerWidget {
  const _PopularEntitiesListMainContent({
    required this.popularEntitiesState,
    required this.entities,
    required this.categoryId,
    required this.onGoToDetails,
  });

  final EntitiesPaginatedState popularEntitiesState;
  final List<Entity> entities;
  final CategoryId categoryId;
  final void Function(BuildContext, WidgetRef, Entity) onGoToDetails;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (entities.isEmpty && popularEntitiesState.paginationError != null) {
      return const _PopularEntitiesListErrorState();
    } else if (entities.isEmpty && !popularEntitiesState.hasMore) {
      return const _PopularEntitiesListEmptyState();
    } else if (entities.isEmpty) {
      return const _PopularEntitiesListInitialLoading();
    } else {
      return _PopularEntitiesListGrid(
        entities: entities,
        popularEntitiesState: popularEntitiesState,
        onGoToDetails: onGoToDetails,
      );
    }
  }
}
