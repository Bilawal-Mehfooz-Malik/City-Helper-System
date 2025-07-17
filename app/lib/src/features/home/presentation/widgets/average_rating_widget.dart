import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home/domain/categories/entity.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

class AverageRatingWidget extends StatelessWidget {
  final Entity entity;
  final bool showReviewText;
  const AverageRatingWidget({
    super.key,
    required this.entity,
    this.showReviewText = false,
  });

  @override
  Widget build(BuildContext context) {
    final reviewsLabel = context.loc.reviews;
    final ratingText = showReviewText
        ? '${entity.avgRating.toStringAsFixed(1)} (${entity.totalReviews} $reviewsLabel)'
        : '${entity.avgRating.toStringAsFixed(1)} (${entity.totalReviews})';

    return Wrap(
      spacing: Sizes.p4,
      children: [
        Icon(Icons.star, color: Colors.amber, size: 18),
        Text(ratingText.hardcoded, style: context.textTheme.labelLarge),
      ],
    );
  }
}
