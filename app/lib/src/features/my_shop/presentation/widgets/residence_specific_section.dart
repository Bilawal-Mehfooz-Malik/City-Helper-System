import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

class ResidenceSpecificSection extends StatelessWidget {
  final double? price;
  final bool isFurnished;
  final ValueChanged<String> onPriceChanged;
  final ValueChanged<bool> onFurnishedChanged;

  const ResidenceSpecificSection({
    super.key,
    required this.price,
    required this.isFurnished,
    required this.onPriceChanged,
    required this.onFurnishedChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          initialValue: price?.toString() ?? '',
          onChanged: onPriceChanged,
          decoration: InputDecoration(
            labelText: 'Price'.hardcoded,
            hintText: 'Enter the price'.hardcoded,
          ),
          keyboardType: TextInputType.number,
        ),
        gapH8,
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: Text('Is Furnished?'.hardcoded),
          value: isFurnished,
          onChanged: onFurnishedChanged,
        ),
      ],
    );
  }
}
