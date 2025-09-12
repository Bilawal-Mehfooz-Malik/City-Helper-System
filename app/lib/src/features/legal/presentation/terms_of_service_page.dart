import 'package:app/src/core/common_widgets/responsive_scrollable.dart';
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
      body: ResponsiveScrollable(
        padding: const EdgeInsets.all(Sizes.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Terms of Service',
              style: textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
              ),
            ),
            gapH8,
            Text(
              'Effective Date: September 12, 2025',
              style: textTheme.bodySmall!.copyWith(
                fontStyle: FontStyle.italic,
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
            gapH32,
            _buildSection(
              context,
              title: '1. Eligibility',
              content: 'You must be at least 13 years old to use this app.',
            ),
            _buildSection(
              context,
              title: '2. User Responsibilities',
              content:
                  '• Provide accurate information when registering shops or residences.\n'
                  '• Do not post false, misleading, offensive, or illegal content.\n'
                  '• You are responsible for the content you upload (images, descriptions, contact info).',
            ),
            _buildSection(
              context,
              title: '3. Content Ownership',
              content:
                  '• Users retain ownership of content they upload (shops, images, details).\n'
                  '• By uploading, you grant FindOut permission to display and distribute your content inside the app.',
            ),
            _buildSection(
              context,
              title: '4. Limitations of Liability',
              content:
                  '• FindOut provides listings “as is” without guarantees of accuracy.\n'
                  '• We are not responsible for incorrect shop details, location errors, or downtime.',
            ),
            _buildSection(
              context,
              title: '5. Account Suspension',
              content:
                  'We may suspend or remove accounts that violate these Terms.',
            ),
            _buildSection(
              context,
              title: '6. Changes',
              content:
                  'We may update these Terms. Continued use of the app means you accept the updated terms.',
            ),
            _buildSection(
              context,
              title: '7. Contact',
              content: 'For questions, email us at: [Your Email].',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required String content,
  }) {
    final textTheme = context.textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: textTheme.titleLarge),
        gapH8,
        Text(content, style: textTheme.bodyLarge!.copyWith(height: 1.5)),
        gapH24,
      ],
    );
  }
}
