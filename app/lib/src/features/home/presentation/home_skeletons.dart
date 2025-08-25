import 'package:app/src/core/common_widgets/section_header.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/categories_list/domain/categories_exception.dart';
import 'package:app/src/features/home/presentation/widgets/entities_grid_layout.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:app/src/themes/theme_helpers.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SubCategorySkeletonList extends StatelessWidget {
  const SubCategorySkeletonList({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
        child: Row(
          children: List.generate(12, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: Sizes.p8),
              child: Chip(label: Text('name'.hardcoded)),
            );
          }),
        ),
      ),
    );
  }
}

class CarouselAdListSkeleton extends StatelessWidget {
  const CarouselAdListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
      child: Column(
        children: [
          Skeletonizer(
            enabled: true,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Bone.square(
                borderRadius: BorderRadius.circular(Sizes.p16),
              ),
            ),
          ),
          gapH16,
        ],
      ),
    );
  }
}

class PopularEntitesSkeletonList extends StatelessWidget {
  const PopularEntitesSkeletonList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: Sizes.p4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Skeletonizer(
          enabled: true,
          child: SectionHeader(
            startWidget: Bone.text(
              words: 1,
              style: context.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            endWidget: Bone.text(words: 1, style: context.textTheme.bodyLarge),
          ),
        ),
        SizedBox(
          height: 275,
          child: ListView.builder(
            itemCount: 5,
            itemExtent: 280,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: Sizes.p16),
            itemBuilder: (_, index) => EntityCardSkeleton(allBorders: false),
          ),
        ),
      ],
    );
  }
}

class EntitiesListSkeleton extends StatelessWidget {
  const EntitiesListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return EntitiesGridLayout(
      itemCount: 3,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (_, _) => EntityCardSkeleton(useCard: false),
      emptyMessage: NoEntityFoundException().message,
    );
  }
}

class EntityCardSkeleton extends StatelessWidget {
  const EntityCardSkeleton({
    super.key,
    this.useCard = true,
    this.allBorders = true,
  });

  final bool useCard;
  final bool allBorders;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: useCard
          ? Card(
              margin: EdgeInsets.only(
                right: Sizes.p8,
                top: Sizes.p4,
                bottom: Sizes.p4,
              ),
              child: EntityCardSkeletonContent(allBorders: allBorders),
            )
          : EntityCardSkeletonContent(allBorders: allBorders),
    );
  }
}

class EntityCardSkeletonContent extends StatelessWidget {
  final bool allBorders;
  const EntityCardSkeletonContent({super.key, required this.allBorders});

  @override
  Widget build(BuildContext context) {
    var radius = ThemeHelpers.borderRadius();
    var borderRadius = BorderRadius.only(topLeft: radius, topRight: radius);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 4 / 3,
          child: Bone.square(
            borderRadius: allBorders ? BorderRadius.all(radius) : borderRadius,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(Sizes.p8),
          child: Column(
            spacing: Sizes.p4,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                spacing: Sizes.p4,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Bone.text(
                      words: 4,
                      style: context.textTheme.titleMedium,
                    ),
                  ),
                  Row(
                    spacing: Sizes.p4,
                    children: [
                      Bone.circle(size: 18),
                      Text(
                        '4.6 (5)'.hardcoded,
                        style: context.textTheme.labelLarge,
                      ),
                    ],
                  ),
                ],
              ),
              Bone.text(words: 5, style: context.textTheme.labelLarge),
            ],
          ),
        ),
      ],
    );
  }
}
