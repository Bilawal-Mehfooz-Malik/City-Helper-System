import 'dart:async';
import 'package:app/src/core/common_widgets/custom_text_button.dart';
import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/core/common_widgets/responsive_center.dart';
import 'package:app/src/core/common_widgets/responsive_scrollable.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:app/src/core/utils/async_value_ui.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/auth/presentation/auth_controller.dart';
import 'package:app/src/features/auth/presentation/phone_number_controller.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  bool _isSmallScreen(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final screenType = ScreenType.determine(
      width: size.width,
      height: size.height,
    );
    return screenType == ScreenType.smallHeight ||
        screenType == ScreenType.mobile;
  }

  @override
  Widget build(BuildContext context) {
    final isSmall = _isSmallScreen(context);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: isSmall
            ? ResponsiveScrollable(
                padding: const EdgeInsets.all(Sizes.p16),
                maxContentWidth: 400,
                child: const _OTPContent(),
              )
            : ResponsiveCenter(
                padding: const EdgeInsets.all(Sizes.p16),
                maxContentWidth: 400,
                child: const _OTPContent(),
              ),
      ),
    );
  }
}

class _OTPContent extends ConsumerStatefulWidget {
  const _OTPContent();

  @override
  ConsumerState<_OTPContent> createState() => _OTPContentState();
}

class _OTPContentState extends ConsumerState<_OTPContent> {
  Timer? _resendTimer;
  int _secondsRemaining = 30;
  bool _isValidCode = false;
  final _focusNode = FocusNode();
  final _otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _startResendTimer();
    _otpController.addListener(_validateCode);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  // TODO: DISPOSE THESE
  // @override
  // void dispose() {
  //   _resendTimer?.cancel();
  //   _otpController.removeListener(_validateCode);
  //   _otpController.dispose();
  //   _focusNode.dispose();
  //   super.dispose();
  // }

  void _validateCode() {
    final code = _otpController.text.trim();
    final isValid = code.length == 6;
    if (isValid != _isValidCode) {
      setState(() {
        _isValidCode = isValid;
      });
    }
  }

  void _startResendTimer() {
    setState(() => _secondsRemaining = 30);
    _resendTimer?.cancel();
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  Future<void> _resendCode(BuildContext context, WidgetRef ref) async {
    final phoneNumber = ref.read(phoneNumberControllerProvider);
    final result = await ref
        .read(authControllerProvider.notifier)
        .sendOtp(phoneNumber);

    if (result.hasError && context.mounted) {
      result.showAlertDialogOnError(context);
      return;
    }

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.loc.confirmCode_resendSuccess)),
      );
    }

    _startResendTimer();
  }

  Future<void> _goToProfileScreen(BuildContext context, WidgetRef ref) async {
    final code = _otpController.text.trim();
    final phoneNumber = ref.read(phoneNumberControllerProvider);

    final result = await ref
        .read(authControllerProvider.notifier)
        .verifyOtp(code: code, verificationId: phoneNumber);

    if (result.hasError && context.mounted) {
      result.showAlertDialogOnError(context);
      return;
    }

    if (context.mounted) {
      context.goNamed(AppRoute.profile.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(authControllerProvider);
    final number = ref.watch(phoneNumberControllerProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: context.colorScheme.primary,
          child: Icon(
            Icons.smartphone,
            color: context.colorScheme.onPrimary,
            size: 30,
          ),
        ),
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
              context.loc.confirmCode_sentMessage(number),
              style: TextStyle(color: context.colorScheme.onSurfaceVariant),
              textAlign: TextAlign.center,
            ),
            InkWell(
              onTap: () => context.pop(),
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
          focusNode: _focusNode,
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
          isLoading: controller.isLoading,
          text: context.loc.confirmCode_verifyButton,
          onPressed: () => _goToProfileScreen(context, ref),
        ),
        gapH12,
        if (_secondsRemaining > 0)
          Text(
            context.loc.confirmCode_resendCountdown(_secondsRemaining),
            style: TextStyle(color: context.colorScheme.onSurfaceVariant),
          )
        else
          CustomTextButton(
            text: context.loc.confirmCode_resendCode,
            onPressed: controller.isLoading
                ? null
                : () => _resendCode(context, ref),
          ),
      ],
    );
  }
}
