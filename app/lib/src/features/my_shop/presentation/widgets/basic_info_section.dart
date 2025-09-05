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
        Text('Business Name *'.hardcoded, style: context.textTheme.titleMedium),
        gapH4,
        TextFormField(
          initialValue: name,
          onChanged: onNameChanged,
          decoration: InputDecoration(
            hintText: 'Enter your business name'.hardcoded,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
          ),
        ),
        gapH8,
        Text('Description *'.hardcoded, style: context.textTheme.titleMedium),
        gapH4,
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 300, // Max height to prevent excessive growth
            minHeight: 80, // Min height for empty field
          ),
          child: TextFormField(
            initialValue: description,
            onChanged: onDescriptionChanged,
            decoration: InputDecoration(
              hintText: 'Write about your business'.hardcoded,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
            ),
            keyboardType: TextInputType.multiline,
            maxLines: null, // Dynamic height
            maxLength: 5000, // Char limit to support ~500 words
            textAlignVertical: TextAlignVertical.top,
          ),
        ),
      ],
    );
  }
}
