// Refactored version of HomeDetailSkeleton and its child widgets
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

class HomeDetailSkeleton extends StatelessWidget {
  const HomeDetailSkeleton({super.key});

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
        const _CarouselSkeleton(),
        if (!isSmall) ...[gapH12, const _ThumbnailListSkeleton()],
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
        ? const _RightSectionContent()
        : const Card(margin: EdgeInsets.zero, child: _RightSectionContent());
  }
}

class _CarouselSkeleton extends StatelessWidget {
  const _CarouselSkeleton();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Bone.square(borderRadius: BorderRadius.circular(Sizes.p12)),
    );
  }
}

class _ThumbnailListSkeleton extends StatelessWidget {
  const _ThumbnailListSkeleton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              child: Bone.square(borderRadius: BorderRadius.circular(Sizes.p8)),
            ),
          );
        },
      ),
    );
  }
}

class _RightSectionContent extends StatelessWidget {
  const _RightSectionContent();

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
          const _LocationRowSkeleton(),
          gapH8,
          const _RatingSkeleton(),
          gapH8,
          const Divider(),
          gapH4,
          const _FurnishedRowSkeleton(),
          gapH4,
          const Divider(),
          const _DetailRowSkeleton(),
          const Divider(),
          gapH4,
          Bone.text(words: 2),
          gapH8,
          const _ContactButtonsSkeleton(),
        ],
      ),
    );
  }
}

class _LocationRowSkeleton extends StatelessWidget {
  const _LocationRowSkeleton();

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: Sizes.p4,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Bone.icon(size: 20),
        const Expanded(child: Bone.text(words: 5)),
        PrimaryButton(text: BoneMock.name),
      ],
    );
  }
}

class _RatingSkeleton extends StatelessWidget {
  const _RatingSkeleton();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: Sizes.p4,
      runSpacing: Sizes.p4,
      children: [Bone.icon(), Bone.text(words: 2)],
    );
  }
}

class _FurnishedRowSkeleton extends StatelessWidget {
  const _FurnishedRowSkeleton();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Bone.text(words: 1), Bone.text(words: 1)],
    );
  }
}

class _DetailRowSkeleton extends StatelessWidget {
  const _DetailRowSkeleton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.p8,
        horizontal: Sizes.p4,
      ),
      child: Row(
        children: [
          Bone.icon(size: 20),
          gapW8,
          const Expanded(child: Bone.text(words: 3)),
          Bone.icon(),
        ],
      ),
    );
  }
}

class _ContactButtonsSkeleton extends StatelessWidget {
  const _ContactButtonsSkeleton();

  @override
  Widget build(BuildContext context) {
    return Wrap(
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

    return Column(
      spacing: Sizes.p8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DescriptionSectionSkeleton(isSmall: isSmall),
        ReviewSectionSkeleton(isSmall: isSmall),
      ],
    );
  }
}

class DescriptionSectionSkeleton extends StatelessWidget {
  const DescriptionSectionSkeleton({super.key, required this.isSmall});

  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return ResponsiveCenter(
      showCard: !isSmall,
      paddingInsideCard: isSmall
          ? EdgeInsets.zero
          : const EdgeInsets.symmetric(
              vertical: Sizes.p8,
              horizontal: Sizes.p16,
            ),
      child: Skeletonizer(
        enabled: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Bone.text(
              words: 1,
              style: context.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            gapH4,
            Bone.multiText(lines: 3),
          ],
        ),
      ),
    );
  }
}

class ReviewSectionSkeleton extends StatelessWidget {
  const ReviewSectionSkeleton({super.key, required this.isSmall});

  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ResponsiveCenter(
        showCard: !isSmall,
        paddingInsideCard: isSmall
            ? EdgeInsets.zero
            : const EdgeInsets.symmetric(
                vertical: Sizes.p8,
                horizontal: Sizes.p16,
              ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Bone.text(
              words: 2,
              style: context.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            gapH16,
            RatingSummarySkeleton(),
            gapH16,
            ReviewListSkeleton(),
          ],
        ),
      ),
    );
  }
}

class RatingSummarySkeleton extends StatelessWidget {
  const RatingSummarySkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Bone.text(
              words: 1,
              style: context.textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            gapH4,
            Row(spacing: 2, children: List.generate(5, (_) => Bone.icon())),
            gapH8,
            Bone.text(words: 2, style: context.textTheme.bodyLarge),
          ],
        ),
        gapW32,
        Expanded(
          child: Column(
            children: List.generate(5, (_) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Bone.text(words: 1),
                    gapW8,
                    Expanded(
                      child: Container(
                        height: 8,
                        decoration: BoxDecoration(
                          color: context.colorScheme.onSurface.withAlpha(100),
                          borderRadius: BorderRadius.circular(Sizes.p8),
                        ),
                      ),
                    ),
                    gapW8,
                    Bone.text(words: 1),
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

class ReviewListSkeleton extends StatelessWidget {
  const ReviewListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(3, (_) => const SingleReviewSkeleton()),
    );
  }
}

class SingleReviewSkeleton extends StatelessWidget {
  const SingleReviewSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Bone.circle(size: 40),
              gapW12,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: Sizes.p8,
                      runSpacing: Sizes.p4,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Bone.text(
                              words: 2,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            gapH4,
                            Bone.text(
                              words: 2,
                              style: TextStyle(
                                color: context.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          spacing: 2,
                          children: List.generate(5, (_) => Bone.icon()),
                        ),
                      ],
                    ),
                    gapH4,
                    Bone.multiText(lines: 2),
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
