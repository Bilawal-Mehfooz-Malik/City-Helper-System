import 'package:app/src/core/common_widgets/custom_text_field.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

class BasicInfoSection extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController phoneController;
  final TextEditingController messagingNumberController;
  final TextEditingController streetAddressController;
  final TextEditingController emailController;

  const BasicInfoSection({
    super.key,
    required this.nameController,
    required this.descriptionController,
    required this.phoneController,
    required this.messagingNumberController,
    required this.streetAddressController,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: Sizes.p8,
      children: [
        CustomTextField(
          controller: nameController,
          hintText: 'Shop Name'.hardcoded,
        ),
        CustomTextField(
          controller: descriptionController,
          hintText: 'Description'.hardcoded,
          keyboardType: TextInputType.multiline,
        ),
        CustomTextField(
          controller: phoneController,
          hintText: 'Phone'.hardcoded,
          keyboardType: TextInputType.number,
        ),
        CustomTextField(
          controller: messagingNumberController,
          hintText: 'Messaging Number'.hardcoded,
          keyboardType: TextInputType.number,
        ),
        CustomTextField(
          controller: streetAddressController,
          hintText: 'Street Address'.hardcoded,
        ),
        CustomTextField(
          controller: emailController,
          hintText: 'Email'.hardcoded,
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }
}
