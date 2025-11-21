import 'package:app/src/core/common_widgets/responsive_center_beta.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/screen_utils.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/features/review/domain/review.dart';
import 'package:app/src/features/home_detail/presentation/widgets/description_widget.dart';
import 'package:app/src/features/home_detail/presentation/widgets/review_section.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app/src/features/home_detail/presentation/widgets/menu_section.dart';

class HomeDetailBottomSection extends ConsumerWidget {
  final EntityDetail entity;
  final List<Review> reviews;
  final bool reviewsLoadFailed;
  const HomeDetailBottomSection({
    super.key,
    required this.entity,
    required this.reviews,
    required this.reviewsLoadFailed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSmall = isMobileScreen(context);
    final foodDetail = entity is FoodDetail ? entity as FoodDetail : null;

    return Column(
      spacing: Sizes.p8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (foodDetail != null && foodDetail.menuImageUrls.isNotEmpty) ...[
          MenuSection(menuImageUrls: foodDetail.menuImageUrls),
        ],
        _DescriptionSection(entity: entity, isSmall: isSmall),

        ReviewSection(
          entity: entity,
          isSmall: isSmall,
          reviews: reviews,
          reviewsLoadFailed: reviewsLoadFailed,
        ),
      ],
    );
  }
}

class _DescriptionSection extends StatelessWidget {
  const _DescriptionSection({required this.entity, required this.isSmall});

  final EntityDetail entity;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return ResponsiveCenter(
      showCard: isSmall ? false : true,
      paddingInsideCard: isSmall
          ? EdgeInsets.zero
          : EdgeInsets.symmetric(vertical: Sizes.p8, horizontal: Sizes.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.loc.description,
            style: context.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          gapH4,
          DescriptionWidget(text: entity.description),
        ],
      ),
    );
  }
}
