import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:flutter/material.dart';

class ImageListSection extends StatelessWidget {
  final String title;
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;

  const ImageListSection({
    super.key,
    required this.title,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
          child: Text(title, style: context.textTheme.bodyMedium),
        ),
        gapH8,
        SizedBox(
          height: 135,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
            itemCount: itemCount,
            separatorBuilder: (context, _) => gapW12,
            itemBuilder: itemBuilder,
          ),
        ),
      ],
    );
  }
}
