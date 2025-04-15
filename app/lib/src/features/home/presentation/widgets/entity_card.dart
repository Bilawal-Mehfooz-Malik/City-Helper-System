import 'package:app/src/core/common_widgets/custom_image.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/features/home/domain/categories/entity.dart';
import 'package:app/src/features/home/domain/categories/residence.dart';
import 'package:app/src/features/home/presentation/widgets/entity_indicator.dart';
import 'package:app/src/features/home/presentation/widgets/item_address_section.dart';
import 'package:app/src/features/home/presentation/widgets/item_price_section.dart';
import 'package:app/src/features/home/presentation/widgets/item_title_section.dart';
import 'package:app/src/themes/theme_helpers.dart';
import 'package:flutter/material.dart';

class EntityCard extends StatelessWidget {
  const EntityCard({super.key, required this.entity});

  final Entity entity;

  @override
  Widget build(BuildContext context) {
    var radius = ThemeHelpers.borderRadius();
    var borderRadius = BorderRadius.only(topLeft: radius, topRight: radius);

    final isResidence = entity is Residence;
    final residence = isResidence ? entity as Residence : null;

    return Column(
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

              if (isResidence && residence != null)
                ItemPriceSection(entity: residence)
              else
                const SizedBox.shrink(),
            ],
          ),
        ),
      ],
    );
  }
}
