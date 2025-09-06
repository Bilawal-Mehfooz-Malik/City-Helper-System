import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

class CoverImagePickerButton extends StatelessWidget {
  final bool hasImage;
  final VoidCallback onPressed;

  const CoverImagePickerButton(
      {super.key, required this.hasImage, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(Icons.image, color: Theme.of(context).colorScheme.onPrimary),
        label: Text(
          hasImage
              ? 'Change Cover Image'.hardcoded
              : 'Pick Cover Image *'.hardcoded,
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.p8),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.p16,
            vertical: Sizes.p12,
          ),
        ),
      ),
    );
  }
}
