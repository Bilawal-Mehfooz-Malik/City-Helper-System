import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/core/common_widgets/responsive_center.dart';
import 'package:app/src/core/common_widgets/responsive_two_column_layout.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home_detail/presentation/widgets/primary_contact_button.dart';
import 'package:app/src/localization/localization_extension.dart';
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
        padding: EdgeInsets.symmetric(vertical: Sizes.p8),
        child: Column(
          spacing: Sizes.p8,
          children: [
            ResponsiveTwoColumnLayout(
              startContent: HomeDetailTopLeftSkeleton(isSmall: isSmall),
              endContent: HomeDetailTopRightSkeleton(),
              spacing: isSmall ? Sizes.p4 : Sizes.p16,
            ),
            HomeDetailBottomSectionSkeleton(),
          ],
        ),
      ),
    );
  }
}

class HomeDetailTopLeftSkeleton extends StatelessWidget {
  const HomeDetailTopLeftSkeleton({super.key, required this.isSmall});

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
        // Thumbnail Navigation Skeleton (only if not small screen)
        if (!isSmall) ...[
          gapH12, // Spacer
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
      ],
    );
  }
}

class HomeDetailTopRightSkeleton extends StatelessWidget {
  const HomeDetailTopRightSkeleton({super.key});

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
    return isSmall
        ? RightSectionContent()
        : Card(margin: EdgeInsets.zero, child: RightSectionContent());
  }
}

class RightSectionContent extends StatelessWidget {
  const RightSectionContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Sizes.p40,
        bottom: Sizes.p16,
        left: Sizes.p8,
        right: Sizes.p8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Location Skeleton
          Row(
            spacing: Sizes.p4,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Bone.icon(size: 20),
              Expanded(child: Bone.text(words: 5)),
              PrimaryButton(text: BoneMock.name),
            ],
          ),
          gapH8,
          // Rating Skeleton
          Wrap(
            spacing: Sizes.p4,
            runSpacing: Sizes.p4,
            children: [Bone.icon(), Bone.text(words: 2)],
          ),
          gapH8,
          Divider(),
          gapH4,
          // Furnished Skeleton
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Bone.text(words: 1), Bone.text(words: 1)],
          ),
          gapH4,
          Divider(),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.p8,
              horizontal: Sizes.p4,
            ),
            child: Row(
              children: [
                Bone.icon(size: 20),
                gapW8,
                Expanded(child: Bone.text(words: 3)),
                Bone.icon(),
              ],
            ),
          ),

          Divider(),
          gapH4,
          Bone.text(words: 2),
          gapH8,
          Wrap(
            spacing: Sizes.p8,
            runSpacing: Sizes.p8,
            children: [
              DetailContactButton(
                icon: Icons.phone,
                color: context.colorScheme.primary,
                label: context.loc.call,
                onPressed: () {},
              ),
              DetailContactButton(
                icon: Icons.chat,
                color: context.colorScheme.primary,
                label: context.loc.message,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeDetailBottomSectionSkeleton extends StatelessWidget {
  const HomeDetailBottomSectionSkeleton({super.key});

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

    return ResponsiveCenter(
      showCard: isSmall ? false : true,
      paddingInsideCard: isSmall
          ? EdgeInsets.zero
          : EdgeInsets.symmetric(vertical: Sizes.p8, horizontal: Sizes.p16),
      child: Skeletonizer(
        enabled: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Skeleton for the "Description" title
            Bone.text(
              words: 1,
              style: context.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            gapH4,

            /// Skeleton for the multiline description (simulated with several lines)
            Bone.multiText(lines: 3),
          ],
        ),
      ),
    );
  }
}
