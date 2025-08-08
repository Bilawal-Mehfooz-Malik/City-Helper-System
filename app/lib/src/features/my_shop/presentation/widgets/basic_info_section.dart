/*
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

class BasicInfoSection extends StatelessWidget {
  final String name;
  final String description;
  final ValueChanged<String> onNameChanged;
  final ValueChanged<String> onDescriptionChanged;

  const BasicInfoSection({
    super.key,
    required this.name,
    required this.description,
    required this.onNameChanged,
    required this.onDescriptionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Shop Name *'.hardcoded, style: context.textTheme.titleMedium),
        gapH4,
        TextFormField(
          initialValue: name,
          onChanged: onNameChanged,
          decoration: InputDecoration(
            hintText: 'Enter your shop name'.hardcoded,
            border: const OutlineInputBorder(),
          ),
          validator: (val) =>
              val!.isEmpty ? 'Name is required'.hardcoded : null,
        ),
        gapH8,
        Text('Description *'.hardcoded, style: context.textTheme.titleMedium),
        gapH4,
        TextFormField(
          initialValue: description,
          onChanged: onDescriptionChanged,
          decoration: InputDecoration(
            hintText: 'Write information about your shop'.hardcoded,
            border: const OutlineInputBorder(),
          ),
          keyboardType: TextInputType.multiline,
          maxLines: 3,
          validator: (val) =>
              val!.isEmpty ? 'Description is required'.hardcoded : null,
        ),
      ],
    );
  }
}
*/