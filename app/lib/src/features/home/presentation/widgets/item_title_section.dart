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
        final isSmallWidth = constraints.maxWidth < 200;

        if (isSmallWidth) {
          return Wrap(
            children: [
              _TitleWidget(name: entity.name, useElipsis: useElipsis),
              _RatingWidget(entity: entity),
            ],
          );
        } else {
          return Row(
            spacing: Sizes.p4,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _TitleWidget(name: entity.name, useElipsis: useElipsis),
              ),
              _RatingWidget(entity: entity),
            ],
          );
        }
      },
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({required this.name, required this.useElipsis});

  final String name;
  final bool useElipsis;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: context.textTheme.titleSmall!.copyWith(fontWeight: .w600),
      overflow: useElipsis ? .ellipsis : null,
    );
  }
}

class _RatingWidget extends StatelessWidget {
  const _RatingWidget({required this.entity});

  final Entity entity;

  @override
  Widget build(BuildContext context) {
    return AverageRatingWidget(
      avgRating: entity.avgRating,
      totalReviews: entity.totalReviews,
    );
  }
}
