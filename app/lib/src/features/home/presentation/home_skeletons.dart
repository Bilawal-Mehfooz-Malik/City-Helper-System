import 'package:app/src/core/common_widgets/section_header.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/categories_list/domain/categories_exception.dart';
import 'package:app/src/features/home/presentation/entities_list_section.dart';
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
          children: List.generate(8, (index) {
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
                borderRadius: BorderRadius.circular(Sizes.p12),
              ),
            ),
          ),
          gapH8,
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
            itemBuilder: (_, index) => EntityCardSkeleton(),
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
    return Column(
      spacing: Sizes.p4,
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
            endWidget: Bone.icon(size: 30),
          ),
        ),
        EntitiesGridLayout(
          itemCount: 3,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (_, __) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.p4,
                horizontal: Sizes.p16,
              ),
              child: EntityCardSkeleton(useCard: false),
            );
          },
          emptyMessage: NoEntityFoundException().message,
        ),
      ],
    );
  }
}

class EntityCardSkeleton extends StatelessWidget {
  const EntityCardSkeleton({
    super.key,
    this.useCard = true,
    this.allBorders = false,
  });

  final bool useCard;
  final bool allBorders;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child:
          useCard
              ? Card(child: EntityCardSkeletonContent(allBorders: allBorders))
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
          child: Bone.square(borderRadius: borderRadius),
        ),
        Padding(
          padding: const EdgeInsets.all(Sizes.p8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Bone.text(words: 2, style: context.textTheme.titleMedium),
                  Row(
                    spacing: Sizes.p4,
                    children: [
                      Bone.circle(size: 18),
                      Text(
                        'rating'.hardcoded,
                        style: context.textTheme.labelLarge,
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                'lorem ipusm halo wizard blueberry hello oppo'.hardcoded,
                style: context.textTheme.labelLarge,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
