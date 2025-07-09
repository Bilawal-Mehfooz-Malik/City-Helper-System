import 'package:app/src/core/common_widgets/custom_text_field.dart';
import 'package:app/src/core/constants/app_sizes.dart';
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
      spacing: Sizes.p8,
      children: [
        CustomTextField(
          controller: facebookController,
          hintText: 'Facebook URL'.hardcoded,
          keyboardType: TextInputType.url,
        ),
        CustomTextField(
          controller: instagramController,
          hintText: 'Instagram URL'.hardcoded,
          keyboardType: TextInputType.url,
        ),
        CustomTextField(
          controller: websiteController,
          hintText: 'Website URL'.hardcoded,
          keyboardType: TextInputType.url,
        ),
      ],
    );
  }
}
