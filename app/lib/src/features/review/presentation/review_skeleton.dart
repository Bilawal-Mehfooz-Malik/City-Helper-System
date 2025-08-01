import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ReviewListTileSkeleton extends StatelessWidget {
  const ReviewListTileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: Sizes.p8,
              runSpacing: Sizes.p4,
              children: [
                Row(
                  children: [
                    CircleAvatar(child: Bone.icon()),
                    gapW12,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Bone.text(
                          words: 1,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Bone.text(
                          words: 2,
                          style: TextStyle(
                            color: context.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                RatingBarIndicator(
                  rating: 0,
                  itemCount: 5,
                  itemSize: 18.0,
                  itemBuilder: (context, _) =>
                      const Icon(Icons.star, color: Colors.amber),
                ),
              ],
            ),
            gapH4,
            Bone.multiText(lines: 2),
            gapH8,
            const Divider(),
          ],
        ),
      ),
    );
  }
}
