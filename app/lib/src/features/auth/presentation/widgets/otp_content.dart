import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:app/src/features/auth/presentation/widgets/phone_avatar.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpContent extends ConsumerWidget {
  final String phoneNumber;
  final TextEditingController otpController;
  final VoidCallback onBack;
  final VoidCallback onSubmit;
  final bool isValidCode;

  const OtpContent({
    super.key,
    required this.phoneNumber,
    required this.otpController,
    required this.onBack,
    required this.onSubmit,
    required this.isValidCode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PhoneAvatar(),
        gapH24,
        Text(
          context.loc.confirmCode_title,
          style: context.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        gapH8,
        Wrap(
          spacing: Sizes.p4,
          runSpacing: Sizes.p4,
          alignment: WrapAlignment.center,
          children: [
            Text(
              context.loc.confirmCode_sentMessage(phoneNumber),
              style: TextStyle(color: context.colorScheme.onSurfaceVariant),
              textAlign: TextAlign.center,
            ),
            InkWell(
              onTap: onBack,
              child: Text(
                context.loc.confirmCode_changeNumber,
                style: TextStyle(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        gapH32,
        PinCodeTextField(
          length: 6,
          appContext: context,
          controller: otpController,
          keyboardType: TextInputType.number,
          pinTheme: PinTheme(
            fieldWidth: 50,
            fieldHeight: 50,
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(Sizes.p8),
            activeFillColor: context.colorScheme.onPrimary,
            inactiveFillColor: context.colorScheme.onPrimary,
            selectedFillColor: context.colorScheme.onPrimary,
            activeColor: context.colorScheme.onSurfaceVariant,
            inactiveColor: context.colorScheme.onSurfaceVariant,
            selectedColor: context.colorScheme.primary,
          ),
        ),
        gapH24,
        PrimaryButton(
          useMaxSize: true,
          isDisabled: !isValidCode,
          isLoading: authState.isLoading,
          text: context.loc.confirmCode_verifyButton,
          onPressed: onSubmit,
        ),
      ],
    );
  }
}