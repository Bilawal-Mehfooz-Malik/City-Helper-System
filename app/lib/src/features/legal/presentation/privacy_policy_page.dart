import 'package:flutter/material.dart';
import 'package:app/src/localization/localization_extension.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.privacyPolicy),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.loc.privacyPolicyTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16.0),
            Text(
              context.loc.privacyPolicyContent,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            // Add more content here
          ],
        ),
      ),
    );
  }
}
