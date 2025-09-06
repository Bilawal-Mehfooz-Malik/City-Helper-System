import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

class GalleryImagePickerButton extends StatelessWidget {
  final bool isLimitReached;
  final VoidCallback onPressed;

  const GalleryImagePickerButton(
      {super.key, required this.isLimitReached, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: isLimitReached ? null : onPressed,
        icon: Icon(
          Icons.photo_library,
          color: isLimitReached
              ? context.colorScheme.onSurface.withAlpha(128)
              : context.colorScheme.onPrimary,
        ),
        label: Text(
          isLimitReached
              ? 'Maximum 10 images reached'.hardcoded
              : 'Add Gallery Images *'.hardcoded,
          style: TextStyle(
            color: isLimitReached
                ? context.colorScheme.onSurface.withAlpha(128)
                : context.colorScheme.onPrimary,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: isLimitReached
              ? context.colorScheme.surface.withAlpha(179)
              : context.colorScheme.primary,
          foregroundColor: isLimitReached
              ? context.colorScheme.onSurface.withAlpha(128)
              : context.colorScheme.onPrimary,
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
