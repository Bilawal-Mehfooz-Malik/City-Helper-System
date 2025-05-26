import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/common_widgets/section_header.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/categories_list/domain/categories_exception.dart';
import 'package:app/src/features/categories_list/presentation/selected_category_view_controller.dart';
import 'package:app/src/features/home/application/entity_service.dart';
import 'package:app/src/features/home/domain/categories/entity.dart';
import 'package:app/src/features/home/presentation/controllers/filter_controller.dart';
import 'package:app/src/features/home/presentation/controllers/list_type_controller.dart';
import 'package:app/src/features/home/presentation/controllers/subcategory_controller.dart';
import 'package:app/src/features/home/presentation/home_skeletons.dart';
import 'package:app/src/features/home/presentation/widgets/entities_grid_layout.dart';
import 'package:app/src/features/home/presentation/widgets/entity_card.dart';
import 'package:app/src/features/home/presentation/widgets/filter_dialog.dart';
import 'package:app/src/features/home_detail/presentation/entity_id_controller.dart';
import 'package:app/src/features/home_detail/presentation/popular_detail_view_controller.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PopularEntitiesListScreen extends ConsumerWidget {
  final bool isPushed;
  final CategoryId categoryId;
  const PopularEntitiesListScreen({
    super.key,
    this.isPushed = true,
    required this.categoryId,
  });

  void _goToDetails(BuildContext context, WidgetRef ref, Entity entity) {
    ref.read(entityIdControllerProvider.notifier).updateEntityId(entity.id);
    ref.read(popularDetailViewControllerProvider.notifier).setPopularView(true);

    final screenSize = MediaQuery.sizeOf(context);
    final screenType = ScreenType.determine(
      width: screenSize.width,
      height: screenSize.height,
    );

    if (screenType == ScreenType.tablet || screenType == ScreenType.desktop) {
      // Use a state provider to indicate the "popular" view should be shown
      ref
          .read(selectedCategoryViewControllerProvider.notifier)
          .setSelectedCategoryView(SelectedCategoryView.detail);
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
      builder: (_) => FilterDialog(categoryId: categoryId),
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
        .read(filterControllerProvider(categoryId: categoryId).notifier)
        .resetFilters();
    if (isPushed) {
      context.pop();
    } else {
      ref
          .read(selectedCategoryViewControllerProvider.notifier)
          .setSelectedCategoryView(SelectedCategoryView.home);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subCategory = ref.watch(subcategoryControllerProvider);
    final entitiesListValue = ref.watch(
      WatchPopularEntitiesProvider(categoryId, subCategory),
    );
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
            slivers: [
              SliverToBoxAdapter(
                child: SectionHeader(
                  startWidget: Text(
                    context.loc.filtersTitle,
                    style: context.textTheme.titleLarge,
                  ),
                  endWidget: IconButton(
                    icon: const Icon(Icons.filter_list_alt),
                    onPressed: entitiesListValue.isLoading
                        ? null
                        : () => _showFilterDialog(context, ref),
                  ),
                ),
              ),
              sliverGapH8,

              AsyncValueSliverWidget(
                value: entitiesListValue,
                loading: const EntitiesListSkeleton(),
                data: (entities) => EntitiesGridLayout(
                  shrinkWrap: true,
                  itemCount: entities.length,
                  physics: const NeverScrollableScrollPhysics(),
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
            ],
          ),
        ),
      ),
    );
  }
}
