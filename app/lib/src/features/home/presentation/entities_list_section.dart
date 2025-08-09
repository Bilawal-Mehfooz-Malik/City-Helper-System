import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/common_widgets/section_header.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/categories_list/domain/categories_exception.dart';
import 'package:app/src/features/home/application/entity_service.dart';
import 'package:app/src/features/home/domain/entity.dart';
import 'package:app/src/features/home/domain/home_section_identifier.dart';
import 'package:app/src/features/home/presentation/controllers/subcategory_controller.dart';
import 'package:app/src/features/home/presentation/home_skeletons.dart';
import 'package:app/src/features/home/presentation/widgets/entities_grid_layout.dart';
import 'package:app/src/features/home/presentation/widgets/entity_card.dart';
import 'package:app/src/features/home/presentation/widgets/filter_dialog.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controllers/home_error_notification_controller.dart';

class EntitiesListSection extends ConsumerWidget {
  final CategoryId categoryId;
  const EntitiesListSection({super.key, required this.categoryId});

  void _goToDetails(BuildContext context, WidgetRef ref, Entity entity) {
    final screenSize = MediaQuery.sizeOf(context);
    final screenType = ScreenType.determine(
      width: screenSize.width,
      height: screenSize.height,
    );

    if (screenType == ScreenType.tablet || screenType == ScreenType.desktop) {
      // TODO: UNCOMMENT
      // context.pushNamed(
      //   AppRoute.homeDetail.name,
      //   pathParameters: {
      //     'categoryId': categoryId.toString(),
      //     'entityId': entity.id,
      //   },
      // );
    } else {
      // TODO: UNCOMMENT
      // context.goNamed(
      //   AppRoute.homeDetail.name,
      //   pathParameters: {
      //     'categoryId': entity.categoryId.toString(),
      //     'entityId': entity.id,
      //   },
      // );
    }
  }

  void _showFilterDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (_) => FilterDialog(categoryId: categoryId),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subCategory = ref.watch(subcategoryControllerProvider);
    final entitiesListValue = ref.watch(
      WatchEntitiesProvider(categoryId, subCategory),
    );

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
            onPressed: entitiesListValue.isLoading
                ? null
                : () => _showFilterDialog(context),
          ),
        ),
        AsyncValueWidget<List<Entity>>(
          value: entitiesListValue,
          loading: const EntitiesListSkeleton(),
          error: (error, stack) {
            // In the next frame, report the error to the central controller.
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ref
                  .read(homeErrorNotificationControllerProvider.notifier)
                  .addFailedSection(HomeSectionIdentifier.entities, error);
            });
            // Return an empty widget to hide this section.
            return const SizedBox.shrink();
          },
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
    );
  }
}
