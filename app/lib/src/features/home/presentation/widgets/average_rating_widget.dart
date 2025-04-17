import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home/domain/categories/entity.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

class AverageRatingWidget extends StatelessWidget {
  final Entity entity;
  const AverageRatingWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: Sizes.p4,
      children: [
        Icon(Icons.star, color: Colors.amber, size: 18),
        Text(
          '${entity.avgRating} (${entity.totalReviews})'.hardcoded,
          style: context.textTheme.labelLarge,
        ),
      ],
    );
  }
}
