import 'package:app/src/core/common_widgets/responsive_two_column_layout.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';

/// A loading skeleton widget for HomeDetailCarouselSlider.
/// It uses the `skeletonizer` package to display a shimmering placeholder
/// that mimics the layout of the actual carousel slider.
class HomeDetailSkeleton extends StatelessWidget {
  const HomeDetailSkeleton({super.key});

  /// Determines if the current screen size is considered "small"
  /// based on predefined breakpoints.
  bool _isSmallScreen(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final screenType = ScreenType.determine(
      width: size.width,
      height: size.height,
    );
    return screenType == ScreenType.smallHeight ||
        screenType == ScreenType.mobile;
  }

  @override
  Widget build(BuildContext context) {
    final isSmall = _isSmallScreen(context);

    return Skeletonizer(
      enabled: true,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: ResponsiveTwoColumnLayout(
            startContent: HomeDetailCarouselSliderSkeleton(isSmall: isSmall),
            endContent: Bone.square(
              borderRadius: BorderRadius.circular(Sizes.p12),
            ),
            spacing: Sizes.p16,
          ),
        ),
      ),
    );
  }
}

class HomeDetailCarouselSliderSkeleton extends StatelessWidget {
  const HomeDetailCarouselSliderSkeleton({super.key, required this.isSmall});

  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Main Carousel Section Skeleton
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Bone.square(borderRadius: BorderRadius.circular(Sizes.p12)),
        ),
        gapH12, // Spacer
        // Thumbnail Navigation Skeleton (only if not small screen)
        if (!isSmall)
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: Sizes.p8),
                  child: SizedBox(
                    width: 100,
                    height: 80,
                    child: Bone.square(
                      borderRadius: BorderRadius.circular(Sizes.p8),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
