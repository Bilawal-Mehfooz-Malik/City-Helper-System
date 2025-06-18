import 'dart:io';

import 'package:app/src/core/common_widgets/custom_outlined_button.dart';
import 'package:app/src/core/common_widgets/custom_text_field.dart';
import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/core/common_widgets/responsive_center.dart';
import 'package:app/src/core/common_widgets/responsive_scrollable.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:app/src/core/utils/async_value_ui.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/auth/presentation/auth_controller.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                child: const _ProfileContent(),
              )
            : ResponsiveCenter(
                padding: const EdgeInsets.all(Sizes.p16),
                maxContentWidth: 400,
                child: const _ProfileContent(),
              ),
      ),
    );
  }
}

class _ProfileContent extends ConsumerStatefulWidget {
  const _ProfileContent();

  @override
  ConsumerState<_ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends ConsumerState<_ProfileContent> {
  File? _profileImage;
  final _picker = ImagePicker();
  final _nameController = TextEditingController();

  // TODO: DISPOSE THESE
  // @override
  // void dispose() {
  //   _nameController.dispose();
  //   super.dispose();
  // }

  Future<void> _uploadPhoto() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _finishSignup(WidgetRef ref) async {
    final name = _nameController.text.trim();
    if (name.length < 4) return;

    final result = await ref
        .read(authControllerProvider.notifier)
        .completeSignup(name: name, profilePicUrl: _profileImage?.path);

    if (result.hasError) {
      if (!mounted) return;
      result.showAlertDialogOnError(context);
      return;
    }

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.loc.profile_createSuccessMessage)),
      );
      context.pop();
      context.pop();
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final isFormFilled = _nameController.text.trim().length >= 4;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          context.loc.profile_welcome,
          style: context.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        gapH8,
        Text(
          context.loc.profile_subtitle,
          style: context.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        gapH24,
        Column(
          children: [
            CircleAvatar(
              radius: 48,
              backgroundImage: _profileImage != null
                  ? FileImage(_profileImage!)
                  : null,
              child: _profileImage == null
                  ? Icon(Icons.person, size: 60)
                  : null,
            ),
            gapH16,
            CustomOutlinedButton(
              onPressed: _uploadPhoto,
              isDisabled: authState.isLoading,
              text: context.loc.profile_uploadPhoto,
            ),
          ],
        ),
        gapH24,
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            context.loc.profile_fullNameLabel,
            style: context.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        gapH8,
        CustomTextField(
          controller: _nameController,
          hintText: context.loc.profile_fullNameHint,
          keyboardType: TextInputType.name,
          onchanged: (value) => setState(() {}),
        ),
        gapH24,
        PrimaryButton(
          useMaxSize: true,
          isDisabled: !isFormFilled,
          isLoading: authState.isLoading,
          onPressed: () => _finishSignup(ref),
          text: context.loc.profile_finishSignup,
        ),
      ],
    );
  }
}
