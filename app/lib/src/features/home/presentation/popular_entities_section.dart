import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/common_widgets/custom_image.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home/application/entity_service.dart';
import 'package:app/src/features/home/domain/categories/entity.dart';
import 'package:app/src/features/home/domain/categories/residence.dart';
import 'package:app/src/features/home/presentation/controllers/subcategory_controller.dart';
import 'package:app/src/features/home/presentation/widgets/item_address_section.dart';
import 'package:app/src/features/home/presentation/widgets/item_price_section.dart';
import 'package:app/src/features/home/presentation/widgets/item_title_section.dart';
import 'package:app/src/features/home/presentation/widgets/entity_indicator.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:app/src/themes/theme_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopularEnitiesSection extends ConsumerWidget {
  final CategoryId categoryId;
  const PopularEnitiesSection({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subCategory = ref.watch(subcategoryControllerProvider);
    final entitiesListValue = ref.watch(
      WatchPopularEntitiesProvider(categoryId, subCategory),
    );

    return AsyncValueWidget(
      value: entitiesListValue,
      data: (list) {
        if (list.isEmpty) {
          return SizedBox.shrink();
        }

        return Column(
          spacing: Sizes.p4,
          children: [
            SectionHeader(),
            SizedBox(
              height: list is List<Residence> ? 300 : 275,
              child: ListView.builder(
                itemExtent: 280,
                itemCount: list.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: Sizes.p12),
                itemBuilder: (context, index) {
                  return _buildPopularEntityCard(list[index]);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Card _buildPopularEntityCard(Entity entity) {
    var radius = ThemeHelpers.borderRadius();
    var borderRadius = BorderRadius.only(topLeft: radius, topRight: radius);

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// [ItemCoverImage]
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              CustomImage(
                borderRadius: borderRadius,
                imageUrl: entity.coverImageUrl,
              ),
              OpenIndicator(),
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

                // * Show price for [Residence], otherwise add a shrinkable SizedBox to avoid empty space
                if (entity is Residence)
                  ItemPriceSection(entity: entity)
                else
                  SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.p12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Popular'.hardcoded,
            style: context.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('See all'.hardcoded, style: context.textTheme.bodyLarge),
        ],
      ),
    );
  }
}
