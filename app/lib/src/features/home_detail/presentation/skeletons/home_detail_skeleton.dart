import 'package:app/src/core/common_widgets/responsive_two_column_layout.dart';
import 'package:app/src/core/utils/screen_utils.dart';
import 'package:app/src/features/home_detail/presentation/skeletons/home_detail_bottom_section_skeleton.dart';
import 'package:app/src/features/home_detail/presentation/skeletons/home_detail_top_left_skeleton.dart';
import 'package:app/src/features/home_detail/presentation/skeletons/home_detail_top_right_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:app/src/core/constants/app_sizes.dart';

class HomeDetailSkeleton extends StatelessWidget {
  const HomeDetailSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmall = isSmallHeightScreen(context) || isMobileScreen(context);

    return Skeletonizer(
      enabled: true,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: Sizes.p8),
        child: Column(
          spacing: Sizes.p8,
          children: [
            ResponsiveTwoColumnLayout(
              startContent: HomeDetailTopLeftSkeleton(isSmall: isSmall),
              endContent: HomeDetailTopRightSkeleton(isSmall: isSmall),
              spacing: isSmall ? Sizes.p4 : Sizes.p16,
            ),
            HomeDetailBottomSectionSkeleton(isSmall: isSmall),
          ],
        ),
      ),
    );
  }
}
