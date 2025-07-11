import 'package:app/src/core/common_widgets/custom_text_field.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

class SocialMediaSection extends StatelessWidget {
  final TextEditingController facebookController;
  final TextEditingController instagramController;
  final TextEditingController websiteController;

  const SocialMediaSection({
    super.key,
    required this.facebookController,
    required this.instagramController,
    required this.websiteController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Facebook Profile'.hardcoded,
          style: context.textTheme.titleMedium,
        ),
        gapH4,
        CustomTextField(
          controller: facebookController,
          hintText: 'Enter your facebook url'.hardcoded,
          keyboardType: TextInputType.url,
        ),
        gapH8,

        Text(
          'Instagram Profile'.hardcoded,
          style: context.textTheme.titleMedium,
        ),
        gapH4,
        CustomTextField(
          controller: instagramController,
          hintText: 'Enter your instagram url'.hardcoded,
          keyboardType: TextInputType.url,
        ),
        gapH8,

        Text('Website Link'.hardcoded, style: context.textTheme.titleMedium),
        gapH4,
        CustomTextField(
          controller: websiteController,
          hintText: 'Enter your website url'.hardcoded,
          keyboardType: TextInputType.url,
        ),
      ],
    );
  }
}
