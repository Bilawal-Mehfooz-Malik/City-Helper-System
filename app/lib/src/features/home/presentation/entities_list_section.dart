import 'package:app/src/core/common_widgets/empty_message_widget.dart';
import 'package:app/src/core/common_widgets/section_header.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/screen_utils.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/categories_list/domain/categories_exception.dart';
import 'package:app/src/features/home/application/entities_notifier.dart';
import 'package:app/src/features/home/domain/entities_pagination_state.dart';
import 'package:app/src/features/home/domain/entity.dart';
import 'package:app/src/features/home/presentation/controllers/filter_context.dart';
import 'package:app/src/features/home/presentation/home_skeletons.dart';
import 'package:app/src/features/home/presentation/widgets/entities_grid_layout.dart';
import 'package:app/src/features/home/presentation/widgets/entity_card.dart';
import 'package:app/src/features/home/presentation/widgets/filter_dialog.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EntitiesListSection extends ConsumerWidget {
  final CategoryId categoryId;
  const EntitiesListSection({super.key, required this.categoryId});

  void _goToDetails(BuildContext context, WidgetRef ref, Entity entity) {
    final screenType = screenTypeOf(context);

    if (screenType == ScreenType.tablet || screenType == ScreenType.desktop) {
      context.pushNamed(
        AppRoute.homeDetail.name,
        pathParameters: {
          'categoryId': categoryId.toString(),
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

  void _showFilterDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (_) => FilterDialog(
        categoryId: categoryId,
        filterContext: FilterContext.all,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entitiesState = ref.watch(entitiesNotifierProvider(categoryId));
    final entities = entitiesState.entities;

    return Column(
      spacing: Sizes.p4,
      children: [
        SectionHeader(
          startWidget: Text(
            context.loc.all,
            style: context.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          endWidget: IconButton(
            icon: const Icon(Icons.filter_list_alt),
            onPressed: () => _showFilterDialog(context),
          ),
        ),
        _EntitiesListContent(
          entitiesState: entitiesState,
          entities: entities,
          onGoToDetails: (entity) => _goToDetails(context, ref, entity),
          categoryId: categoryId,
        ),
      ],
    );
  }
}

class _EntitiesListContent extends ConsumerWidget {
  const _EntitiesListContent({
    required this.entitiesState,
    required this.entities,
    required this.onGoToDetails,
    required this.categoryId,
  });

  final EntitiesPaginatedState entitiesState;
  final List<Entity> entities;
  final void Function(Entity) onGoToDetails;
  final CategoryId categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (entities.isEmpty && entitiesState.paginationError != null) {
      return CenteredMessageWidget(
        useResponsiveDesign: false,
        message: NoEntityFoundException().message,
      );
    } else if (entities.isEmpty && !entitiesState.hasMore) {
      return CenteredMessageWidget(
        useResponsiveDesign: false,
        message: NoEntityFoundException().message,
      );
    } else if (entities.isEmpty) {
      return const EntitiesListSkeleton();
    } else {
      return Column(
        children: [
          EntitiesGridLayout(
            shrinkWrap: true,
            itemCount:
                entities.length + (entitiesState.isLoadingNextPage ? 4 : 0),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              if (index < entities.length) {
                final entity = entities[index];
                return EntityCard(
                  entity: entity,
                  useElipsis: false,
                  onTap: () => onGoToDetails(entity),
                );
              }
              return const EntityCardSkeleton(useCard: false);
            },
            emptyMessage: NoEntityFoundException().message,
          ),
          if (entitiesState.paginationError != null && entities.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  Text(context.loc.anErrorOccurred),
                  ElevatedButton(
                    onPressed: () => ref
                        .read(entitiesNotifierProvider(categoryId).notifier)
                        .fetchNextPage(),
                    child: Text(context.loc.retry),
                  ),
                ],
              ),
            ),
        ],
      );
    }
  }
}
