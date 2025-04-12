import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home/domain/categories/entity.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

class ItemAddressSection extends StatelessWidget {
  final Entity entity;
  const ItemAddressSection({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Sector ${entity.sectorName}, '.hardcoded,
          style: context.textTheme.labelLarge,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          entity.cityName,
          style: context.textTheme.labelLarge,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
