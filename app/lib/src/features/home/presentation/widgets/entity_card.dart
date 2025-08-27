import 'package:app/src/core/common_widgets/custom_image.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/currency_formatter.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home/domain/entity.dart';
import 'package:app/src/features/home/presentation/widgets/entity_indicator.dart';
import 'package:app/src/features/home/presentation/widgets/item_title_section.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ---------------------------------------------
/// ENTITY CARD
/// ---------------------------------------------
class EntityCard extends StatelessWidget {
  const EntityCard({
    super.key,
    required this.entity,
    this.allBorders = true,
    this.useElipsis = true,
    this.onTap,
  });

  final Entity entity;
  final bool allBorders;
  final bool useElipsis;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.only(
      topLeft: Radius.circular(Sizes.p12),
      topRight: Radius.circular(Sizes.p12),
    );

    final isResidence = entity is Residence;
    final residence = isResidence ? entity as Residence : null;

    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// [ItemCoverImage + Indicator]
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              CustomImageWrapper(
                aspectRatio: 4 / 3,
                borderRadius: allBorders
                    ? BorderRadius.all(Radius.circular(Sizes.p12))
                    : borderRadius,
                imageUrl: entity.coverImageUrl,
              ),
              Positioned(
                bottom: Sizes.p4,
                left: Sizes.p4,
                child: EntityStatusIndicator(entity: entity),
              ),
            ],
          ),

          /// [ItemDetails]
          Padding(
            padding: const EdgeInsets.all(Sizes.p8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ItemTitleSection(entity: entity, useElipsis: useElipsis),
                Text(
                  '${context.loc.sector} ${entity.sectorName}, ${entity.cityName} ',
                  style: context.textTheme.labelLarge,
                  overflow: useElipsis ? TextOverflow.ellipsis : null,
                ),

                if (isResidence && residence != null)
                  Consumer(
                    builder: (context, ref, child) {
                      final priceFormatted = ref
                          .watch(currencyFormatterProvider)
                          .format(residence.pricing.cost);
                      return Text(
                        '$priceFormatted ${residence.pricing.displayLabel}',
                        style: context.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: useElipsis ? TextOverflow.ellipsis : null,
                      );
                    },
                  )
                else
                  const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
