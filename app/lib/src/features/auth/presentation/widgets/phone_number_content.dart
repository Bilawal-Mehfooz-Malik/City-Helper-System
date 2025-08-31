import 'package:app/src/core/common_widgets/custom_text_field.dart';
import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:app/src/features/auth/presentation/widgets/phone_avatar.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/src/core/utils/phone_number_formatter.dart';

class PhoneNumberContent extends ConsumerWidget {
  final String countryCode;
  final TextEditingController phoneNumberController;
  final VoidCallback onSubmit;
  final void Function(String)? onchanged;

  const PhoneNumberContent({
    super.key,
    required this.countryCode,
    required this.phoneNumberController,
    required this.onSubmit,
    required this.onchanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    final isValid = phoneNumberController.text.trim().length == 11;

    return Padding(
      padding: const EdgeInsets.all(Sizes.p16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PhoneAvatar(),
          gapH24,
          Text(
            context.loc.enterPhoneNum,
            style: context.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          gapH4,
          Text(
            context.loc.confirmationCodeMessage,
            style: TextStyle(color: context.colorScheme.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
          gapH24,
          Row(
            children: [
              SizedBox(
                width: 80,
                child: DropdownButtonFormField<String>(
                  value: countryCode,
                  items: [countryCode].map((code) {
                    return DropdownMenuItem(value: code, child: Text('+$code'));
                  }).toList(),
                  onChanged: null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              gapW12,
              Expanded(
                child: CustomTextField(
                  enabled: !authState.isLoading,
                  hintText: '3XX XXXXXXX'.hardcoded,
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  onchanged: onchanged,
                  inputFormatters: [PhoneNumberFormatter()],
                ),
              ),
            ],
          ),
          gapH24,
          PrimaryButton(
            useMaxSize: true,
            text: context.loc.continueText,
            isDisabled: !isValid,
            isLoading: authState.isLoading,
            onPressed: onSubmit,
          ),
        ],
      ),
    );
  }
}
