import 'package:app/src/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
