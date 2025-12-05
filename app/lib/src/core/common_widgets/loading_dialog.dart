import 'package:app/src/core/common_widgets/custom_progress_indicator.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:flutter/material.dart';

class SmallLoadingDialog extends StatelessWidget {
  final String message;
  const SmallLoadingDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final theme = context.colorScheme;

    return Center(
      child: Container(
        padding: .symmetric(horizontal: Sizes.p24, vertical: Sizes.p16),
        decoration: BoxDecoration(
          color: theme.surface,
          borderRadius: .circular(Sizes.p8),
          boxShadow: [
            BoxShadow(blurRadius: 12, color: Colors.black.withAlpha(50)),
          ],
        ),
        child: Row(
          mainAxisSize: .min,
          spacing: Sizes.p16,
          children: [
            CustomCircularProgressIndicator(size: 28, strokeWidth: 3),
            Text(
              message,
              style: context.textTheme.bodyLarge!.copyWith(
                color: theme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
