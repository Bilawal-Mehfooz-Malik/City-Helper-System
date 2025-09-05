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
          'Facebook Profile (optional)'.hardcoded,
          style: context.textTheme.titleMedium,
        ),
        gapH4,
        TextFormField(
          initialValue: facebook,
          onChanged: onFacebookChanged,
          decoration: InputDecoration(
            hintText: 'e.g. @yourshop'.hardcoded,
            border: OutlineInputBorder(),
          ),
        ),
        gapH8,
        Text(
          'Instagram Profile (optional)'.hardcoded,
          style: context.textTheme.titleMedium,
        ),
        gapH4,
        TextFormField(
          initialValue: instagram,
          onChanged: onInstagramChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'e.g. @yourshop'.hardcoded,
          ),
        ),
        gapH8,
        Text(
          'Website Link (optional)'.hardcoded,
          style: context.textTheme.titleMedium,
        ),
        gapH4,
        TextFormField(
          initialValue: website,
          onChanged: onWebsiteChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'e.g. www.yourshop.com'.hardcoded,
          ),
          keyboardType: TextInputType.url,
        ),
      ],
    );
  }
}
