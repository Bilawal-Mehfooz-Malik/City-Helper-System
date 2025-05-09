import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/common_widgets/section_header.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/categories_list/domain/categories_exception.dart';
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

class EntitiesListSection extends ConsumerWidget {
  final CategoryId categoryId;
  const EntitiesListSection({super.key, required this.categoryId});

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
            onPressed:
                entitiesListValue.isLoading
                    ? null
                    : () => _showFilterDialog(context),
          ),
        ),
        AsyncValueWidget<List<Entity>>(
          value: entitiesListValue,
          loading: const EntitiesListSkeleton(),
          error: (_, __) => const SizedBox.shrink(),
          data:
              (entities) => EntitiesGridLayout(
                shrinkWrap: true,
                itemCount: entities.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder:
                    (_, index) =>
                        EntityCard(entity: entities[index], useElipsis: false),
                emptyMessage: NoEntityFoundException().message,
              ),
        ),
      ],
    );
  }
}
