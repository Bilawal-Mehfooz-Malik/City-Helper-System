import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:flutter/material.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.p20,
          vertical: Sizes.p24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Terms of Service',
              style: textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
              ),
            ),
            gapH16,
            Text(
              'Effective Date: [Insert Date]',
              style: textTheme.bodyMedium!.copyWith(
                fontStyle: FontStyle.italic,
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            gapH24,

            // Section 1
            Text(
              '1. Eligibility',
              style: textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            gapH8,
            Text(
              'You must be at least 13 years old to use this app.',
              style: textTheme.bodyLarge!.copyWith(height: 1.5),
            ),
            gapH20,

            // Section 2
            Text(
              '2. User Responsibilities',
              style: textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            gapH8,
            Text(
              '• Provide accurate information when registering shops or residences.\n'
              '• Do not post false, misleading, offensive, or illegal content.\n'
              '• You are responsible for the content you upload (images, descriptions, contact info).',
              style: textTheme.bodyLarge!.copyWith(height: 1.5),
            ),
            gapH20,

            // Section 3
            Text(
              '3. Content Ownership',
              style: textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            gapH8,
            Text(
              '• Users retain ownership of content they upload (shops, images, details).\n'
              '• By uploading, you grant FindOut permission to display and distribute your content inside the app.',
              style: textTheme.bodyLarge!.copyWith(height: 1.5),
            ),
            gapH20,

            // Section 4
            Text(
              '4. Limitations of Liability',
              style: textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            gapH8,
            Text(
              '• FindOut provides listings “as is” without guarantees of accuracy.\n'
              '• We are not responsible for incorrect shop details, location errors, or downtime.',
              style: textTheme.bodyLarge!.copyWith(height: 1.5),
            ),
            gapH20,

            // Section 5
            Text(
              '5. Account Suspension',
              style: textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            gapH8,
            Text(
              'We may suspend or remove accounts that violate these Terms.',
              style: textTheme.bodyLarge!.copyWith(height: 1.5),
            ),
            gapH20,

            // Section 6
            Text(
              '6. Changes',
              style: textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            gapH8,
            Text(
              'We may update these Terms. Continued use of the app means you accept the updated terms.',
              style: textTheme.bodyLarge!.copyWith(height: 1.5),
            ),
            gapH20,

            // Section 7
            Text(
              '7. Contact',
              style: textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            gapH8,
            Text(
              'For questions, email us at: [Your Email].',
              style: textTheme.bodyLarge!.copyWith(height: 1.5),
            ),
            gapH12,
          ],
        ),
      ),
    );
  }
}
