import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home/domain/categories/entity.dart';
import 'package:app/src/features/home/presentation/widgets/average_rating_widget.dart';
import 'package:flutter/material.dart';

class ItemTitleSection extends StatelessWidget {
  final Entity entity;
  const ItemTitleSection({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: Sizes.p4,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            entity.name,
            style: context.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        AverageRatingWidget(entity: entity),
      ],
    );
  }
}
