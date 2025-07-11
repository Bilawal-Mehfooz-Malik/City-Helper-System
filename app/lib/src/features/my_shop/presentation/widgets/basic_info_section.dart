import 'package:app/src/core/common_widgets/custom_text_field.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

class BasicInfoSection extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController phoneController;
  final TextEditingController messagingNumberController;
  final TextEditingController cityNameController;
  final TextEditingController sectorNameController;
  final TextEditingController streetAddressController;
  final TextEditingController emailController;

  const BasicInfoSection({
    super.key,
    required this.nameController,
    required this.descriptionController,
    required this.phoneController,
    required this.messagingNumberController,
    required this.cityNameController,
    required this.sectorNameController,
    required this.streetAddressController,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Shop Name'.hardcoded, style: context.textTheme.titleMedium),
        gapH4,
        CustomTextField(
          controller: nameController,
          hintText: 'Enter your shop name'.hardcoded,
        ),
        gapH8,

        Text('Description'.hardcoded, style: context.textTheme.titleMedium),
        gapH4,
        CustomTextField(
          controller: descriptionController,
          hintText: 'Write information about your shop'.hardcoded,
          keyboardType: TextInputType.multiline,
        ),
        gapH8,

        Text('Call Number'.hardcoded, style: context.textTheme.titleMedium),
        gapH4,
        CustomTextField(
          controller: phoneController,
          hintText: 'Enter your calling number'.hardcoded,
          keyboardType: TextInputType.number,
        ),
        gapH8,

        Text(
          'Messaging Number'.hardcoded,
          style: context.textTheme.titleMedium,
        ),
        gapH4,
        CustomTextField(
          controller: messagingNumberController,
          hintText: 'Enter your messaging number'.hardcoded,
          keyboardType: TextInputType.number,
        ),
        gapH8,

        Text('City Name'.hardcoded, style: context.textTheme.titleMedium),
        gapH4,
        CustomTextField(
          controller: cityNameController,
          hintText: 'Enter your city name'.hardcoded,
        ),
        gapH8,

        Text('Sector Name'.hardcoded, style: context.textTheme.titleMedium),
        gapH4,
        CustomTextField(
          controller: sectorNameController,
          hintText: 'C4'.hardcoded,
        ),
        gapH8,

        Text('Street Address'.hardcoded, style: context.textTheme.titleMedium),
        gapH4,
        CustomTextField(
          controller: streetAddressController,
          hintText: 'Enter your street address'.hardcoded,
        ),
        gapH8,

        Text('Email Address'.hardcoded, style: context.textTheme.titleMedium),
        gapH4,
        CustomTextField(
          controller: emailController,
          hintText: 'Enter your email address'.hardcoded,
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }
}
