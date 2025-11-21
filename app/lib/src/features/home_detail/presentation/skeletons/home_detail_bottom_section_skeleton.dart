import 'package:app/src/core/common_widgets/responsive_center_beta.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeDetailBottomSectionSkeleton extends StatelessWidget {
  const HomeDetailBottomSectionSkeleton({super.key, required this.isSmall});

  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: Sizes.p8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _DescriptionSectionSkeleton(isSmall: isSmall),
        ReviewSectionSkeleton(isSmall: isSmall),
      ],
    );
  }
}

class _DescriptionSectionSkeleton extends StatelessWidget {
  const _DescriptionSectionSkeleton({required this.isSmall});

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
          spacing: Sizes.p16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Bone.text(
              words: 2,
              style: context.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            RatingGraphSkeleton(),
            ReviewListSkeleton(),
          ],
        ),
      ),
    );
  }
}

class RatingGraphSkeleton extends StatelessWidget {
  const RatingGraphSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 300;

        if (isNarrow) {
          return Column(
            spacing: Sizes.p32,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLeftSkeleton(context),
              _buildRightSkeleton(context),
            ],
          );
        }

        return Row(
          spacing: Sizes.p16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLeftSkeleton(context),
            Expanded(child: _buildRightSkeleton(context)),
          ],
        );
      },
    );
  }

  Widget _buildLeftSkeleton(BuildContext context) {
    return Column(
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
    );
  }

  Widget _buildRightSkeleton(BuildContext context) {
    return Column(
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
    );
  }
}

class ReviewListSkeleton extends StatelessWidget {
  const ReviewListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: List.generate(3, (_) => _SingleReviewSkeleton()));
  }
}

class _SingleReviewSkeleton extends StatelessWidget {
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
              _SingleReviewRightSection(),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}

class _SingleReviewRightSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                    style: const TextStyle(fontWeight: FontWeight.bold),
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
              Row(spacing: 2, children: List.generate(5, (_) => Bone.icon())),
            ],
          ),
          gapH4,
          Bone.multiText(lines: 2),
        ],
      ),
    );
  }
}
