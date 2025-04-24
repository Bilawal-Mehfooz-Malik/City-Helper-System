import 'package:app/src/core/common_widgets/custom_image.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home/domain/categories/entity.dart';
import 'package:app/src/features/home/domain/categories/residence.dart';
import 'package:app/src/features/home/presentation/widgets/entity_indicator.dart';
import 'package:app/src/features/home/presentation/widgets/item_title_section.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:app/src/themes/theme_helpers.dart';
import 'package:flutter/material.dart';

class EntityCard extends StatelessWidget {
  const EntityCard({super.key, required this.entity, this.smallScreen = true});

  final Entity entity;
  final bool smallScreen;

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
              borderRadius:
                  smallScreen ? borderRadius : BorderRadius.all(radius),
              imageUrl: entity.coverImageUrl,
            ),
            Padding(
              padding:
                  smallScreen
                      ? EdgeInsets.zero
                      : EdgeInsets.only(bottom: Sizes.p4, left: Sizes.p4),
              child:
                  entity.isEntityOpen()
                      ? OpenIndicator(allBorders: !smallScreen)
                      : CloseIndicator(allBorders: !smallScreen),
            ),
          ],
        ),

        /// [ItemDetails]
        Padding(
          padding: const EdgeInsets.all(Sizes.p8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ItemTitleSection(entity: entity, useElipsis: smallScreen),
              Text(
                '${context.loc.sector} ${entity.sectorName}, ${entity.cityName} '
                    .hardcoded,
                style: context.textTheme.labelLarge,
                overflow: smallScreen ? TextOverflow.ellipsis : null,
              ),

              if (isResidence && residence != null)
                Text(
                  '${context.loc.startsFrom} Rs. ${residence.price.toString()}'
                      .hardcoded,
                  style: context.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: smallScreen ? TextOverflow.ellipsis : null,
                )
              else
                const SizedBox.shrink(),
            ],
          ),
        ),
      ],
    );
  }
}
