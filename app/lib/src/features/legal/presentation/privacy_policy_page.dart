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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.p20,
          vertical: Sizes.p24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
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
              '1. Information We Collect',
              style: textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            gapH8,
            Text(
              '• User Profile Data: Name, phone number, profile image, last known location (if enabled).\n'
              '• Location Data: Collected from your device if you allow location access.\n'
              '• Shop Registration Data: Shop name, description, address, contact info, social links, opening hours, pricing, images, and menu details.\n'
              '• Device & Usage Data: Basic analytics to improve app performance (non-identifiable).',
              style: textTheme.bodyLarge!.copyWith(height: 1.5),
            ),
            gapH20,

            // Section 2
            Text(
              '2. How We Use Your Data',
              style: textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            gapH8,
            Text(
              '• To create and manage user accounts.\n'
              '• To allow users to register and discover shops, residences, and food places.\n'
              '• To display shop/residence details on maps and in search results.\n'
              '• To improve the app experience and prevent fraud or misuse.',
              style: textTheme.bodyLarge!.copyWith(height: 1.5),
            ),
            gapH20,

            // Section 3
            Text(
              '3. Sharing of Data',
              style: textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            gapH8,
            Text(
              '• With Firebase (for authentication, data storage, and media uploads).\n'
              '• With Google Maps APIs (to show maps, geolocation, and directions).\n'
              '• We do not sell personal information.',
              style: textTheme.bodyLarge!.copyWith(height: 1.5),
            ),
            gapH20,

            // Section 4
            Text(
              '4. User Rights',
              style: textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            gapH8,
            Text(
              '• You can update or delete your profile at any time in the app.\n'
              '• You can request complete data deletion by contacting us at: [Your Email].\n'
              '• You can disable location sharing from device settings.',
              style: textTheme.bodyLarge!.copyWith(height: 1.5),
            ),
            gapH20,

            // Section 5
            Text(
              '5. Security',
              style: textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            gapH8,
            Text(
              'We use Firebase Security Rules and encryption to protect your data. '
              'However, no system is 100% secure.',
              style: textTheme.bodyLarge!.copyWith(height: 1.5),
            ),
            gapH20,

            // Section 6
            Text(
              '6. Children’s Privacy',
              style: textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            gapH8,
            Text(
              'FindOut is not intended for children under 13.',
              style: textTheme.bodyLarge!.copyWith(height: 1.5),
            ),
            gapH20,

            // Section 7
            Text(
              '7. Changes',
              style: textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            gapH8,
            Text(
              'We may update this Privacy Policy. Changes will be posted in the app.',
              style: textTheme.bodyLarge!.copyWith(height: 1.5),
            ),
            gapH20,

            // Section 8
            Text(
              '8. Contact',
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
