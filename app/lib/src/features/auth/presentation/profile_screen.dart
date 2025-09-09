import 'package:app/src/core/common_widgets/responsive_center.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:app/src/core/utils/is_small_screen.dart.dart';
import 'package:app/src/features/auth/presentation/controllers/phone_number_controller.dart';
import 'package:app/src/features/auth/presentation/widgets/profile_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneNumber = ref.read(phoneNumberControllerProvider);
    final isSmall = isSmallScreen(context);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ResponsiveCenter(
          maxContentWidth: Breakpoint.tablet,
          child: ProfileContent(
            phoneNumber: phoneNumber,
            isSmallScreen: isSmall,
          ),
        ),
      ),
    );
  }
}