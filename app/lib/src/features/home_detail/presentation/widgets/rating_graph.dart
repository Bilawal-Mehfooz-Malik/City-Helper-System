import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/features/home_detail/domain/rating_breakdown.dart';
import 'package:app/src/localization/localization_extension.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingGraph extends StatelessWidget {
  final EntityDetail entity;
  const RatingGraph({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 300;

        if (isNarrow) {
          // Small screen → stack vertically
          return Column(
            spacing: Sizes.p16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LeftRatingGraphSection(entity: entity),
              RightRatingGraphSection(entity: entity),
            ],
          );
        }

        // Large screen → show side by side
        return Row(
          spacing: Sizes.p32,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LeftRatingGraphSection(entity: entity),
            Expanded(child: RightRatingGraphSection(entity: entity)),
          ],
        );
      },
    );
  }
}

class LeftRatingGraphSection extends StatelessWidget {
  const LeftRatingGraphSection({super.key, required this.entity});

  final EntityDetail entity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          entity.avgRating.toStringAsFixed(1),
          style: context.textTheme.headlineLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        gapH4,
        RatingBarIndicator(
          rating: entity.avgRating,
          itemCount: 5,
          itemSize: 20.0,
          itemBuilder: (context, _) =>
              Icon(Icons.star, color: Theme.of(context).colorScheme.tertiary),
        ),
        gapH8,
        Text('${entity.totalReviews} ${context.loc.reviews}'),
      ],
    );
  }
}

class RightRatingGraphSection extends StatelessWidget {
  const RightRatingGraphSection({super.key, required this.entity});

  final EntityDetail entity;

  @override
  Widget build(BuildContext context) {
    final totalRatings = entity.totalReviews;
    final breakdownList = entity.ratingBreakdown;

    return Column(
      children: List.generate(5, (index) {
        final star = 5 - index;

        final rating = breakdownList.firstWhere(
          (r) => r.stars == star,
          orElse: () => RatingBreakdown(stars: star, count: 0),
        );

        final percentage = rating.percentageOf(totalRatings);

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(
            children: [
              Text('$star'),
              gapW8,
              Expanded(
                child: LinearProgressIndicator(
                  minHeight: 8,
                  value: percentage / 100,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              gapW8,
              Text('${percentage.toStringAsFixed(0)}%'),
            ],
          ),
        );
      }),
    );
  }
}
