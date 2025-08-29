import 'package:app/src/core/common_widgets/responsive_center.dart';
import 'package:app/src/core/common_widgets/responsive_scrollable.dart';
import 'package:app/src/core/utils/is_small_screen.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/async_value_ui.dart';
import 'package:app/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:app/src/features/auth/presentation/widgets/otp_content.dart';
import 'package:app/src/features/auth/presentation/widgets/phone_number_content.dart';
import 'package:app/src/features/auth/presentation/widgets/profile_content.dart';

enum AuthFlowStep { phoneNumber, otp, profile }

class AuthFlowScreen extends ConsumerStatefulWidget {
  const AuthFlowScreen({super.key});

  @override
  ConsumerState<AuthFlowScreen> createState() => _AuthFlowScreenState();
}

class _AuthFlowScreenState extends ConsumerState<AuthFlowScreen> {
  final _phoneNumberController = TextEditingController();
  TextEditingController? _otpController;
  bool _isValidCode = false;

  final String _countryCode = '92';
  AuthFlowStep _currentStep = AuthFlowStep.phoneNumber;

  String get _fullPhoneNumber =>
      '+$_countryCode${_phoneNumberController.text.replaceAll(RegExp(r'\D'), '').trim()}';

  void _setupOtpController() {
    _otpController?.removeListener(_validateOtpCode);
    _otpController?.dispose();

    _otpController = TextEditingController();
    _otpController!.addListener(_validateOtpCode);
    _isValidCode = false;
  }

  void _validateOtpCode() {
    final isValid = _otpController!.text.trim().length == 6;
    if (isValid != _isValidCode) {
      setState(() {
        _isValidCode = isValid;
      });
    }
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _otpController?.dispose();
    super.dispose();
  }

  Future<void> _submitPhoneNumber() async {
    final result = await ref
        .read(authControllerProvider.notifier)
        .sendOtp(_fullPhoneNumber);

    if (result.hasError && mounted) {
      result.showAlertDialogOnError(context);
      return;
    }

    if (mounted) {
      _setupOtpController();
      setState(() => _currentStep = AuthFlowStep.otp);
    }
  }

  Future<void> _verifyOtp() async {
    final code = _otpController!.text.trim();
    final result = await ref
        .read(authControllerProvider.notifier)
        .verifyOtp(code: code);

    if (result.hasError && mounted) {
      result.showAlertDialogOnError(context);
      return;
    }

    if (mounted) {
      setState(() => _currentStep = AuthFlowStep.profile);
    }
  }

  void _onPhoneNumberChanged(_) => setState(() {});

  @override
  Widget build(BuildContext context) {
    final isSmall = isSmallScreen(context);
    Widget child;
    switch (_currentStep) {
      case AuthFlowStep.phoneNumber:
        child = PhoneNumberContent(
          countryCode: _countryCode,
          phoneNumberController: _phoneNumberController,
          onSubmit: _submitPhoneNumber,
          onchanged: _onPhoneNumberChanged,
        );
        break;
      case AuthFlowStep.otp:
        child = OtpContent(
          key: ValueKey(_currentStep),
          phoneNumber: _fullPhoneNumber,
          otpController: _otpController!,
          isValidCode: _isValidCode,
          onBack: () => setState(() {
            _otpController = null;
            _currentStep = AuthFlowStep.phoneNumber;
          }),
          onSubmit: _verifyOtp,
        );
        break;
      case AuthFlowStep.profile:
        child = ProfileContent(
          phoneNumber: _fullPhoneNumber,
          isSmallScreen: isSmall,
        );
        break;
    }

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: isSmall
              ? ResponsiveScrollable(
                  maxContentWidth: 400,
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
                  child: child,
                )
              : ResponsiveCenter(
                  maxContentWidth: 400,
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
                  child: child,
                ),
        ),
      ),
    );
  }
}
