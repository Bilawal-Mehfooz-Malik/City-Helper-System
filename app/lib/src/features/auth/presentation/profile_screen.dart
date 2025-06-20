import 'dart:io' show File;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:go_router/go_router.dart';

import 'package:app/src/core/common_widgets/custom_outlined_button.dart';
import 'package:app/src/core/common_widgets/custom_text_field.dart';
import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/core/common_widgets/responsive_scrollable.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/async_value_ui.dart';
import 'package:app/src/core/utils/default_location_provider.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:app/src/features/startup/presentation/controllers/location_controller.dart';
import 'package:app/src/features/startup/presentation/startup_content/google_map_widget.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/routers/app_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ResponsiveScrollable(
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
  XFile? _profileImage;
  final _picker = ImagePicker();
  final _nameController = TextEditingController();
  String? _existingImageUrl;
  bool _imageRemoved = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _uploadPhoto() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = pickedFile;
        _imageRemoved = false;
      });
    }
  }

  void _removePhoto() {
    setState(() {
      _profileImage = null;
      _imageRemoved = true;
    });
  }

  ImageProvider? _getProfileImageProvider() {
    if (_profileImage != null) {
      return kIsWeb
          ? NetworkImage(_profileImage!.path)
          : FileImage(File(_profileImage!.path));
    }
    if (!_imageRemoved &&
        _existingImageUrl != null &&
        _existingImageUrl!.isNotEmpty) {
      return kIsWeb
          ? NetworkImage(_existingImageUrl!)
          : FileImage(File(_existingImageUrl!));
    }
    return null;
  }

  Future<void> _submitProfile({required bool isEdit}) async {
    final name = _nameController.text.trim();
    if (name.length < 4) return;

    final controller = ref.read(authControllerProvider.notifier);
    final result = isEdit
        ? await controller.updateProfile(
            name: name,
            profilePicUrl: _imageRemoved ? '' : _profileImage?.path,
          )
        : await controller.completeSignup(
            name: name,
            profilePicUrl: _imageRemoved ? '' : _profileImage?.path,
          );

    if (result.hasError) {
      if (!mounted) return;
      result.showAlertDialogOnError(context);
      return;
    }

    if (mounted) {
      final message = isEdit
          ? context.loc.profile_updateSuccessMessage
          : context.loc.profile_createSuccessMessage;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));

      context.pop();
      context.pop();
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final user = ref.watch(authStateChangesProvider).value;
    final defaultLocation = ref.watch(defaultLocationProvider);
    final userLocation = ref.watch(locationControllerProvider).value;

    final isEdit = user?.name != null;

    // Only initialize once
    if (_nameController.text.isEmpty && user?.name != null) {
      _nameController.text = user!.name!;
    }
    if (_existingImageUrl == null && user?.profileImageUrl != null) {
      _existingImageUrl = user!.profileImageUrl;
    }

    final isFormFilled = _nameController.text.trim().length >= 4;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          isEdit
              ? context.loc.account_editProfile
              : context.loc.profile_welcome,
          style: context.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        gapH4,
        Text(
          context.loc.profile_subtitle,
          style: context.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        gapH16,
        Column(
          children: [
            CircleAvatar(
              radius: 48,
              backgroundImage: _getProfileImageProvider(),
              child: _getProfileImageProvider() == null
                  ? const Icon(Icons.person, size: 60)
                  : null,
            ),
            gapH16,
            Wrap(
              spacing: Sizes.p8,
              runSpacing: Sizes.p4,
              children: [
                CustomOutlinedButton(
                  onPressed: _uploadPhoto,
                  isDisabled: authState.isLoading,
                  text: context.loc.profile_uploadPhoto,
                ),
                CustomOutlinedButton(
                  onPressed: _removePhoto,
                  isDisabled:
                      authState.isLoading ||
                      (_profileImage == null &&
                          (_existingImageUrl == null || _imageRemoved)),
                  text: context.loc.profile_removePhoto,
                ),
              ],
            ),
          ],
        ),
        gapH16,
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            context.loc.profile_fullNameLabel,
            style: context.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        gapH4,
        CustomTextField(
          controller: _nameController,
          hintText: context.loc.profile_fullNameHint,
          keyboardType: TextInputType.name,
          onchanged: (_) => setState(() {}),
        ),
        gapH16,
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            context.loc.account_yourLocation,
            style: context.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        gapH8,
        GestureDetector(
          onTap: authState.isLoading
              ? null
              : () => context.pushNamed(AppRoute.pickYourLocation.name),
          child: AbsorbPointer(
            child: SizedBox(
              height: 250,
              child: GoogleMapWidget(latLng: userLocation ?? defaultLocation),
            ),
          ),
        ),
        gapH12,
        PrimaryButton(
          useMaxSize: true,
          isDisabled: !isFormFilled,
          isLoading: authState.isLoading,
          onPressed: () => _submitProfile(isEdit: isEdit),
          text: isEdit
              ? context.loc.common_save
              : context.loc.profile_finishSignup,
        ),
      ],
    );
  }
}
