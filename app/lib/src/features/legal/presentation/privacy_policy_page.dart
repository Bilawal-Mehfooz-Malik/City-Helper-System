import 'package:app/src/core/common_widgets/responsive_scrollable.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

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
              'Privacy Policy',
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
              title: '1. Information We Collect',
              content:
                  '• User Profile Data: Name, phone number, profile image, last known location (if enabled).\n'
                  '• Location Data: Collected from your device if you allow location access.\n'
                  '• Shop Registration Data: Shop name, description, address, contact info, social links, opening hours, pricing, images, and menu details.\n'
                  '• Device & Usage Data: Basic analytics to improve app performance (non-identifiable).',
            ),
            _buildSection(
              context,
              title: '2. How We Use Your Data',
              content:
                  '• To create and manage user accounts.\n'
                  '• To allow users to register and discover shops, residences, and food places.\n'
                  '• To display shop/residence details on maps and in search results.\n'
                  '• To improve the app experience and prevent fraud or misuse.',
            ),
            _buildSection(
              context,
              title: '3. Sharing of Data',
              content:
                  '• With Firebase (for authentication, data storage, and media uploads).\n'
                  '• With Google Maps APIs (to show maps, geolocation, and directions).\n'
                  '• We do not sell personal information.',
            ),
            _buildSection(
              context,
              title: '4. User Rights',
              content:
                  '• You can update or delete your profile at any time in the app.\n'
                  '• You can request complete data deletion by contacting us at: [Your Email].\n'
                  '• You can disable location sharing from device settings.',
            ),
            _buildSection(
              context,
              title: '5. Security',
              content:
                  'We use Firebase Security Rules and encryption to protect your data. '
                  'However, no system is 100% secure.',
            ),
            _buildSection(
              context,
              title: '6. Children’s Privacy',
              content: 'FindOut is not intended for children under 13.',
            ),
            _buildSection(
              context,
              title: '7. Changes',
              content:
                  'We may update this Privacy Policy. Changes will be posted in the app.',
            ),
            _buildSection(
              context,
              title: '8. Contact',
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
