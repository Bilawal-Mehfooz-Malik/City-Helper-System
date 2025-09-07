import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';

import 'package:flutter/material.dart';

class AverageRatingWidget extends StatelessWidget {
  final double avgRating;
  final int totalReviews;
  final bool showReviewText;
  const AverageRatingWidget({
    super.key,
    this.showReviewText = false,
    required this.avgRating,
    required this.totalReviews,
  });

  @override
  Widget build(BuildContext context) {
    final reviewsLabel = context.loc.reviews;
    final ratingText = showReviewText
        ? '${avgRating.toStringAsFixed(1)} ($totalReviews $reviewsLabel)'
        : '${avgRating.toStringAsFixed(1)} ($totalReviews)';

    return Wrap(
      spacing: Sizes.p4,
      children: [
        Icon(Icons.star, color: context.colorScheme.tertiary, size: 18),
        Text(ratingText.hardcoded, style: context.textTheme.labelLarge),
      ],
    );
  }
}
