import 'package:app/src/core/common_widgets/responsive_center_beta.dart';
import 'package:app/src/core/common_widgets/responsive_scrollable_beta.dart';
import 'package:app/src/core/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app/src/core/utils/async_value_ui.dart';
import 'package:app/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:app/src/features/auth/presentation/widgets/otp_content.dart';
import 'package:app/src/features/auth/presentation/widgets/phone_number_content.dart';

enum AuthFlowStep { phoneNumber, otp }

class AuthFlowScreen extends ConsumerStatefulWidget {
  const AuthFlowScreen({super.key});

  @override
  ConsumerState<AuthFlowScreen> createState() => _AuthFlowScreenState();
}

class _AuthFlowScreenState extends ConsumerState<AuthFlowScreen> {
  late TextEditingController _phoneNumberController;
  final String _countryCode = '92';
  AuthFlowStep _currentStep = AuthFlowStep.phoneNumber;
  String get _fullPhoneNumber =>
      '+$_countryCode${_phoneNumberController.text.replaceAll(RegExp(r'\D'), '').trim()}';

  @override
  void initState() {
    super.initState();
    _phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
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
      setState(() => _currentStep = AuthFlowStep.otp);
    }
  }

  Future<void> _verifyOtp(String code) async {
    final notifier = ref.read(authControllerProvider.notifier);
    final result = await notifier.verifyOtpAndCheckProfile(code: code);

    if (result.hasError && mounted) {
      result.showAlertDialogOnError(context);
    }
  }

  void _onPhoneNumberChanged(_) {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final isSmall = isMobileScreen(context);
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
          key: const ValueKey('OtpContent'),
          phoneNumber: _fullPhoneNumber,
          onBack: () => setState(() {
            _currentStep = AuthFlowStep.phoneNumber;
          }),
          onSubmit: _verifyOtp,
        );
        break;
    }

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: isSmall
              ? ResponsiveScrollable(maxContentWidth: 400, child: child)
              : ResponsiveCenter(maxContentWidth: 400, child: child),
        ),
      ),
    );
  }
}
