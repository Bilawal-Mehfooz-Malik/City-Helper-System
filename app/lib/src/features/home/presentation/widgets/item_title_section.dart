import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home/domain/entity.dart';
import 'package:app/src/features/home/presentation/widgets/average_rating_widget.dart';
import 'package:flutter/material.dart';

class ItemTitleSection extends StatelessWidget {
  final Entity entity;
  final bool useElipsis;
  const ItemTitleSection({
    super.key,
    required this.entity,
    this.useElipsis = true,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 200) {
          return Wrap(
            children: [
              Text(
                entity.name,
                style: context.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                overflow: useElipsis ? TextOverflow.ellipsis : null,
              ),
              AverageRatingWidget(
                avgRating: entity.avgRating,
                totalReviews: entity.totalReviews,
              ),
            ],
          );
        } else {
          return Row(
            spacing: Sizes.p4,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  entity.name,
                  style: context.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: useElipsis ? TextOverflow.ellipsis : null,
                ),
              ),
              AverageRatingWidget(
                avgRating: entity.avgRating,
                totalReviews: entity.totalReviews,
              ),
            ],
          );
        }
      },
    );
  }
}
