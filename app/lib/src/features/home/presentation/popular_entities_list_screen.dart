import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/common_widgets/section_header.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/categories_list/domain/categories_exception.dart';
import 'package:app/src/features/categories_list/presentation/selected_category_view_controller.dart';
import 'package:app/src/features/home/application/entity_service.dart';
import 'package:app/src/features/home/domain/categories/entity.dart';
import 'package:app/src/features/home/presentation/controllers/subcategory_controller.dart';
import 'package:app/src/features/home/presentation/home_skeletons.dart';
import 'package:app/src/features/home/presentation/widgets/entities_grid_layout.dart';
import 'package:app/src/features/home/presentation/widgets/entity_card.dart';
import 'package:app/src/features/home/presentation/widgets/filter_dialog.dart';
import 'package:app/src/localization/localization_extension.dart';
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

  void _showFilterDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (_) => FilterDialog(categoryId: categoryId),
    );
  }

  void _onBack(BuildContext context, WidgetRef ref) {
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
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: context.theme.scaffoldBackgroundColor,
        backgroundColor: context.theme.scaffoldBackgroundColor,
        leading: BackButton(onPressed: () => _onBack(context, ref)),
        title: Text(context.loc.popular),
      ),
      body: SafeArea(
        child: AsyncValueWidget<List<Entity>>(
          value: entitiesListValue,
          loading: EntitiesGridLayout(
            itemCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            emptyMessage: NoEntityFoundException().message,
            itemBuilder: (_, __) => EntityCardSkeleton(useCard: false),
          ),
          data:
              (entities) => CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SectionHeader(
                      startWidget: Text(
                        context.loc.filtersTitle,
                        style: context.textTheme.titleLarge,
                      ),
                      endWidget: IconButton(
                        icon: const Icon(Icons.filter_list_alt),
                        onPressed: () => _showFilterDialog(context),
                      ),
                    ),
                  ),
                  sliverGapH8,
                  SliverToBoxAdapter(
                    child: EntitiesGridLayout(
                      shrinkWrap: true,
                      itemCount: entities.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder:
                          (_, index) => EntityCard(
                            entity: entities[index],
                            useElipsis: false,
                          ),
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
