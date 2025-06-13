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
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LeftRatingGraphSection(entity: entity),
          gapW32,
          RightRatingGraphSection(entity: entity),
        ],
      ),
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
              const Icon(Icons.star, color: Colors.amber),
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

    return Expanded(
      child: Column(
        children: List.generate(5, (index) {
          final star = 5 - index;

          // Find matching RatingBreakdown or default to 0
          final rating = breakdownList.firstWhere(
            (r) => r.starRating == star,
            orElse: () => RatingBreakdown(starRating: star, ratingCount: 0),
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
      ),
    );
  }
}
