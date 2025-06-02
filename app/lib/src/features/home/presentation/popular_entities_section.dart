import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/common_widgets/custom_text_button.dart';
import 'package:app/src/core/common_widgets/section_header.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/categories_list/presentation/selected_category_view_controller.dart';
import 'package:app/src/features/home/application/entity_service.dart';
import 'package:app/src/features/home/domain/categories/entity.dart';
import 'package:app/src/features/home/domain/categories/residence.dart';
import 'package:app/src/features/home/presentation/controllers/filter_controller.dart';
import 'package:app/src/features/home/presentation/controllers/list_type_controller.dart';
import 'package:app/src/features/home/presentation/controllers/subcategory_controller.dart';
import 'package:app/src/features/home/presentation/home_skeletons.dart';
import 'package:app/src/features/home/presentation/widgets/entity_card.dart';
import 'package:app/src/features/home_detail/presentation/controllers/entity_id_controller.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PopularEnitiesSection extends ConsumerWidget {
  final CategoryId categoryId;
  const PopularEnitiesSection({super.key, required this.categoryId});

  void _goToDetails(BuildContext context, WidgetRef ref, Entity entity) {
    ref.read(entityIdControllerProvider.notifier).updateEntityId(entity.id);

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
        .read(filterControllerProvider(categoryId: categoryId).notifier)
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
        pathParameters: {'categoryId': categoryId.toString()},
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subCategory = ref.watch(subcategoryControllerProvider);
    final popularEntitiesListValue = ref.watch(
      WatchPopularEntitiesProvider(categoryId, subCategory),
    );

    return AsyncValueWidget<List<Entity>>(
      value: popularEntitiesListValue,
      loading: const PopularEntitesSkeletonList(),
      error: (_, __) => const SizedBox.shrink(),
      data: (entities) {
        if (entities.isEmpty) {
          return const SizedBox.shrink();
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
                onPressed: popularEntitiesListValue.isLoading
                    ? null
                    : () => _onSeeAllPressed(context, ref),
                text: context.loc.seeAll,
              ),
            ),

            SizedBox(
              height: entities.isNotEmpty && entities.first is Residence
                  ? 300
                  : 275,
              child: ListView.builder(
                itemExtent: 280,
                shrinkWrap: true,
                itemCount: entities.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: Sizes.p16),
                itemBuilder: (_, index) {
                  final entity = entities[index];
                  return Card(
                    margin: EdgeInsets.only(
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
      },
    );
  }
}
