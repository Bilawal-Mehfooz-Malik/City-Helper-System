import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

class SocialMediaSection extends StatelessWidget {
  final String facebook;
  final String instagram;
  final String website;
  final ValueChanged<String> onFacebookChanged;
  final ValueChanged<String> onInstagramChanged;
  final ValueChanged<String> onWebsiteChanged;

  const SocialMediaSection({
    super.key,
    required this.facebook,
    required this.instagram,
    required this.website,
    required this.onFacebookChanged,
    required this.onInstagramChanged,
    required this.onWebsiteChanged,
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
        TextFormField(
          initialValue: facebook,
          onChanged: onFacebookChanged,
          decoration: InputDecoration(
            hintText: 'Enter your facebook url'.hardcoded,
          ),
          keyboardType: TextInputType.url,
        ),
        gapH8,
        Text(
          'Instagram Profile'.hardcoded,
          style: context.textTheme.titleMedium,
        ),
        gapH4,
        TextFormField(
          initialValue: instagram,
          onChanged: onInstagramChanged,
          decoration: InputDecoration(
            hintText: 'Enter your instagram url'.hardcoded,
          ),
          keyboardType: TextInputType.url,
        ),
        gapH8,
        Text('Website Link'.hardcoded, style: context.textTheme.titleMedium),
        gapH4,
        TextFormField(
          initialValue: website,
          onChanged: onWebsiteChanged,
          decoration: InputDecoration(
            hintText: 'Enter your website url'.hardcoded,
          ),
          keyboardType: TextInputType.url,
        ),
      ],
    );
  }
}
