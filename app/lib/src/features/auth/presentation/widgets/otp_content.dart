import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:app/src/features/auth/presentation/widgets/phone_avatar.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpContent extends ConsumerStatefulWidget {
  final String phoneNumber;
  final VoidCallback onBack;
  final ValueChanged<String> onSubmit;

  const OtpContent({
    super.key,
    required this.phoneNumber,
    required this.onBack,
    required this.onSubmit,
  });

  @override
  ConsumerState<OtpContent> createState() => _OtpContentState();
}

class _OtpContentState extends ConsumerState<OtpContent> {
  late final TextEditingController _otpController;
  bool _isValidCode = false;
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    _otpController = TextEditingController();
    _otpController.addListener(_validateOtpCode);
  }

  @override
  void dispose() {
    if (_isDisposed) return;
    _isDisposed = true;
    _otpController.removeListener(_validateOtpCode);
    _otpController.dispose();
    super.dispose();
  }

  String _formatPhoneNumberForDisplay(String phoneNumber) {
    if (phoneNumber.startsWith('+92') && phoneNumber.length == 13) {
      // Format for Pakistan numbers: +92 3XX XXXXXXX
      return '${phoneNumber.substring(0, 3)} ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    }
    // Return original number if it doesn't match the expected format
    return phoneNumber;
  }

  void _validateOtpCode() {
    if (!mounted) return;
    final isValid = _otpController.text.trim().length == 6;
    if (isValid != _isValidCode) {
      setState(() {
        _isValidCode = isValid;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

    return Padding(
      padding: const EdgeInsets.all(Sizes.p16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const PhoneAvatar(),
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
                context.loc.confirmCode_sentMessage(
                  _formatPhoneNumberForDisplay(widget.phoneNumber),
                ),
                style: TextStyle(color: context.colorScheme.onSurfaceVariant),
                textAlign: TextAlign.center,
              ),
              InkWell(
                onTap: widget.onBack,
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
            controller: _otpController,
            autoDisposeControllers: false,
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
            isDisabled: !_isValidCode,
            isLoading: authState.isLoading,
            text: context.loc.confirmCode_verifyButton,
            onPressed: () => widget.onSubmit(_otpController.text.trim()),
          ),
        ],
      ),
    );
  }
}
