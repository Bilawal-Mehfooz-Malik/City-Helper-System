import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home/domain/categories/residence.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

class ItemPriceSection extends StatelessWidget {
  final Residence entity;
  const ItemPriceSection({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: Sizes.p4,

      children: [
        Text(
          'Starts from Rs.'.hardcoded,
          style: context.textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        Expanded(
          child: Text(
            entity.price.toString(),
            style: context.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
