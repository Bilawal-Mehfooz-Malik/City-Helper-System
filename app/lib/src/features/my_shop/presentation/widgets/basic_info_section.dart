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
    const int maxWords = 500; // Reasonable limit for UX

    // Word count validator
    String? validateDescription(String? value) {
      if (value == null || value.isEmpty) {
        return 'Description is required'.hardcoded;
      }
      final wordCount = value.trim().split(RegExp(r'\s+')).length;
      if (wordCount > maxWords) {
        return 'Description cannot exceed $maxWords words'.hardcoded;
      }
      return null;
    }

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
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
          ),
          validator: (val) =>
              val!.isEmpty ? 'Name is required'.hardcoded : null,
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
              hintText:
                  'Write about your business, what you offer, your values, etc.'
                      .hardcoded,
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
            validator: validateDescription,
          ),
        ),
      ],
    );
  }
}
