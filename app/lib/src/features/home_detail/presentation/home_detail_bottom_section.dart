import 'package:app/src/core/common_widgets/responsive_center.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/is_small_screen.dart.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/features/review/domain/review.dart';
import 'package:app/src/features/home_detail/presentation/widgets/description_widget.dart';
import 'package:app/src/features/home_detail/presentation/widgets/review_section.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';

class HomeDetailBottomSection extends StatelessWidget {
  final EntityDetail entity;
  final List<Review> reviews;
  const HomeDetailBottomSection({
    super.key,
    required this.entity,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    final isSmall = isSmallScreen(context);

    return Column(
      spacing: Sizes.p8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _DescriptionSection(entity: entity, isSmall: isSmall),
        ReviewSection(entity: entity, isSmall: isSmall, reviews: reviews),
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
