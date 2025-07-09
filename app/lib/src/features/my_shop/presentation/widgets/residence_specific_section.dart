import 'package:app/src/core/common_widgets/custom_text_field.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

class ResidenceSpecificSection extends StatelessWidget {
  final TextEditingController priceController;
  final bool isFurnished;
  final GenderPreference genderPref;
  final ValueChanged<bool> onFurnishedChanged;

  const ResidenceSpecificSection({
    super.key,
    required this.priceController,
    required this.isFurnished,
    required this.genderPref,
    required this.onFurnishedChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: Sizes.p8,
      children: [
        CustomTextField(
          controller: priceController,
          hintText: 'Price'.hardcoded,
          keyboardType: TextInputType.number,
        ),
        SwitchListTile(
          title: Text('Is Furnished?'.hardcoded),
          value: isFurnished,
          onChanged: onFurnishedChanged,
        ),
      ],
    );
  }
}
