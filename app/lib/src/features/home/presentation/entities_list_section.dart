import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/common_widgets/custom_image.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/categories_list/domain/categories_exception.dart';
import 'package:app/src/core/common_widgets/grid_layout.dart';
import 'package:app/src/features/home/application/entity_service.dart';
import 'package:app/src/features/home/domain/categories/residence.dart';
import 'package:app/src/features/home/presentation/controllers/subcategory_controller.dart';
import 'package:app/src/features/home/presentation/widgets/entity_indicator.dart';
import 'package:app/src/features/home/presentation/widgets/item_address_section.dart';
import 'package:app/src/features/home/presentation/widgets/item_price_section.dart';
import 'package:app/src/features/home/presentation/widgets/item_title_section.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EntitiesListSection extends ConsumerWidget {
  final CategoryId categoryId;
  const EntitiesListSection({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subCategory = ref.watch(subcategoryControllerProvider);
    final entitiesListValue = ref.watch(
      WatchEntitiesProvider(categoryId, subCategory),
    );

    return Column(
      spacing: Sizes.p4,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Nearby'.hardcoded,
                style: context.textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.filter_list_alt, size: 30),
            ],
          ),
        ),

        AsyncValueWidget(
          value: entitiesListValue,
          data: (list) {
            return GridLayout(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: list.length,
              itemBuilder: (context, index) {
                final entity = list[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.p12,
                    vertical: Sizes.p4,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// [ItemCoverImage]
                      Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          CustomImage(imageUrl: entity.coverImageUrl),
                          Padding(
                            padding: const EdgeInsets.all(Sizes.p8),
                            child: OpenIndicator(allBorders: true),
                          ),
                        ],
                      ),

                      /// [ItemDetails]
                      Padding(
                        padding: const EdgeInsets.all(Sizes.p8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ItemTitleSection(entity: entity),
                            ItemAddressSection(entity: entity),

                            // * Conditionally showing price for [ResidenceCategory]
                            if (entity is Residence)
                              ItemPriceSection(entity: entity),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              emptyMessage: NoEntityFoundException().message,
            );
          },
        ),
      ],
    );
  }
}
