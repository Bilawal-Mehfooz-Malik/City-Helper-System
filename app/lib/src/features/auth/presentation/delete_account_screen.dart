import 'package:app/src/core/common_widgets/responsive_center_beta.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.loc.deleteAccount)),
      body: ResponsiveCenter(
        padding: const EdgeInsets.all(Sizes.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How to Delete Your Account',
              style: context.textTheme.headlineSmall,
            ),
            gapH24,
            Text(
              "We're sorry to see you go. To delete your account, please follow these steps:",
              style: context.textTheme.bodyLarge,
            ),
            gapH16,
            Text(
              '1. Log in to your account within the app.',
              style: context.textTheme.bodyLarge,
            ),
            gapH8,
            Text(
              "2. Navigate to the 'Account' screen from the main menu.",
              style: context.textTheme.bodyLarge,
            ),
            gapH8,
            Text(
              "3. Scroll down and tap the 'Delete Account' button.",
              style: context.textTheme.bodyLarge,
            ),
            gapH8,
            Text(
              '4. Follow the on-screen instructions to confirm the deletion.',
              style: context.textTheme.bodyLarge,
            ),
            gapH24,
            Text(
              'Please note that deleting your account is permanent and will erase all your data, including your profile and reviews.',
              style: context.textTheme.bodyLarge?.copyWith(
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
