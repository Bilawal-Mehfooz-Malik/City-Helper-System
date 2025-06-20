import 'package:app/src/core/common_widgets/custom_text_field.dart';
import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/core/common_widgets/responsive_center.dart';
import 'package:app/src/core/common_widgets/responsive_scrollable.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:app/src/core/utils/async_value_ui.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:app/src/features/auth/presentation/controllers/phone_number_controller.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:app/src/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// TODO: Dispose controllers
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

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

    final content = const _AuthContent();

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: isSmall
            ? ResponsiveScrollable(
                padding: const EdgeInsets.all(Sizes.p16),
                maxContentWidth: 500,
                child: content,
              )
            : ResponsiveCenter(
                padding: const EdgeInsets.all(Sizes.p16),
                maxContentWidth: 500,
                child: content,
              ),
      ),
    );
  }
}

class _AuthContent extends ConsumerStatefulWidget {
  const _AuthContent();

  @override
  ConsumerState<_AuthContent> createState() => _AuthContentState();
}

class _AuthContentState extends ConsumerState<_AuthContent> {
  final String _countryCode = '92';
  final _phoneNumberController = TextEditingController();

  Future<void> _goToOtpScreen(BuildContext context, WidgetRef ref) async {
    final fullNumber = '+$_countryCode ${_phoneNumberController.text.trim()}';
    ref.read(phoneNumberControllerProvider.notifier).setNumber(fullNumber);

    final result = await ref
        .read(authControllerProvider.notifier)
        .sendOtp(fullNumber);

    if (result.hasError && context.mounted) {
      result.showAlertDialogOnError(context);
      return;
    }

    if (context.mounted) {
      context.pushNamed(AppRoute.otp.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    final phone = _phoneNumberController.text.trim();
    final isInvalid = phone.isEmpty || phone.length < 11;

    final authState = ref.watch(authControllerProvider);

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
                value: _countryCode,
                items: [_countryCode].map((code) {
                  return DropdownMenuItem(value: code, child: Text('+$code'));
                }).toList(),
                onChanged: null,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            gapW12,
            Expanded(
              child: CustomTextField(
                enabled: !authState.isLoading,
                hintText: '03XX XXXXXXX'.hardcoded,
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                onchanged: (value) => setState(() {}),
              ),
            ),
          ],
        ),
        gapH24,
        PrimaryButton(
          useMaxSize: true,
          text: context.loc.continueText,
          isDisabled: isInvalid,
          isLoading: authState.isLoading,
          onPressed: () => _goToOtpScreen(context, ref),
        ),
      ],
    );
  }
}
