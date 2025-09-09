import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/common_widgets/custom_progress_indicator.dart';
import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/features/auth/data/user_repository.dart';
import 'package:app/src/features/auth/domain/app_user.dart';
import 'package:app/src/features/auth/presentation/controllers/profile_image_controller.dart';
import 'package:app/src/features/auth/presentation/widgets/profile_image_widget.dart';
import 'package:app/src/features/auth/presentation/widgets/profile_location_map.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:app/src/core/common_widgets/custom_text_field.dart';
import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/async_value_ui.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:app/src/features/auth/presentation/controllers/profile_location_controller.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ProfileContent extends ConsumerStatefulWidget {
  final String phoneNumber;
  final bool isSmallScreen;
  const ProfileContent({
    super.key,
    required this.phoneNumber,
    required this.isSmallScreen,
  });

  @override
  ConsumerState<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends ConsumerState<ProfileContent> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _submit(AppUser? existingProfile) async {
    final name = _nameController.text.trim();

    if (name.length < 4) {
      return;
    }

    // Get image state from the provider
    final imageState = ref.read(profileImageControllerProvider);
    final imageFile = imageState.imageFile;
    final removeImage = imageState.imageRemoved;

    // Read bytes from XFile if it exists
    final imageBytes = imageFile != null ? await imageFile.readAsBytes() : null;

    final controller = ref.read(authControllerProvider.notifier);
    final user = ref.read(authStateChangesProvider).value;

    if (user == null) {
      return;
    }

    final newLocation = ref.read(profileLocationControllerProvider).value;

    final bool isEditMode = existingProfile != null;

    // --- Location comparison logic ---
    bool locationChanged = false;
    if (isEditMode) {
      if (existingProfile.lastLocation == null && newLocation != null) {
        locationChanged = true;
      } else if (existingProfile.lastLocation != null && newLocation == null) {
        locationChanged = true;
      } else if (existingProfile.lastLocation != null && newLocation != null) {
        if (!_locationsEqual(existingProfile.lastLocation!, newLocation)) {
          locationChanged = true;
        }
      }
    }
    // --- End of location comparison ---

    if (isEditMode) {
      final isNameUnchanged = name == existingProfile.name;
      final isImageUnchanged = imageBytes == null && !removeImage;

      if (isNameUnchanged && isImageUnchanged && !locationChanged) {
        if (mounted) context.pop();
        return;
      }
    }

    // Save location to profileLocationController if it's a new location or has changed
    if (newLocation != null && (isEditMode ? locationChanged : true)) {
      await ref
          .read(profileLocationControllerProvider.notifier)
          .saveLocation(newLocation);
    }

    // Call createUser or updateUser
    if (isEditMode) {
      await controller.updateUser(
        name: name,
        profileImageBytes: imageBytes,
        removeProfileImage: removeImage,
        location: locationChanged ? newLocation : null,
      );
    } else {
      await controller.createUser(
        name: name,
        profileImageBytes: imageBytes,
        location: newLocation,
      );
    }

    if (!mounted) {
      return;
    }

    // Check the state of the controller for errors
    if (controller.state.hasError) {
      controller.state.showAlertDialogOnError(context);
    } else {
      context.pop();
    }
  }

  // Utility method to compare LatLng values
  bool _locationsEqual(LatLng a, LatLng b) {
    return (a.latitude - b.latitude).abs() < 0.00001 &&
        (a.longitude - b.longitude).abs() < 0.00001;
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final user = ref.watch(authStateChangesProvider).value;

    final profileValue = user != null
        ? ref.watch(fetchUserByIdProvider(user.uid))
        : const AsyncValue<AppUser?>.data(null);

    return Padding(
      padding: const EdgeInsets.all(Sizes.p16),
      child: AsyncValueWidget(
        value: profileValue,
        loading: widget.isSmallScreen
            ? LayoutBuilder(
                builder: (context, constraints) {
                  final safeHeight = constraints.hasBoundedHeight
                      ? constraints.maxHeight
                      : MediaQuery.sizeOf(context).height * 0.5;
                  return ConstrainedBox(
                    constraints: BoxConstraints(minHeight: safeHeight),
                    child: const CenteredProgressIndicator(),
                  );
                },
              )
            : const CenteredProgressIndicator(),
        data: (profile) {
          final bool isEditMode = profile != null;

          if (isEditMode && _nameController.text.isEmpty) {
            _nameController.text = profile.name;
          } else if (!isEditMode) {
            _nameController.clear();
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  isEditMode
                      ? context.loc.account_editProfile
                      : context.loc.profile_welcome,
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                gapH4,
                Text(context.loc.profile_subtitle, textAlign: TextAlign.center),
                gapH24,

                ProfileImageWidget(
                  initialImageUrl: profile?.profileImageUrl,
                  isLoading: authState.isLoading,
                ),

                gapH24,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    context.loc.profile_fullNameLabel,
                    style: context.textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                gapH4,
                CustomTextField(
                  enabled: !authState.isLoading,
                  controller: _nameController,
                  hintText: 'Enter your name (min 4 characters)'.hardcoded,
                  keyboardType: TextInputType.name,
                ),
                gapH16,

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    context.loc.account_yourLocation,
                    style: context.textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                gapH4,
                const ProfileLocationMap(),

                gapH16,

                ValueListenableBuilder<TextEditingValue>(
                  valueListenable: _nameController,
                  builder: (context, value, child) {
                    return PrimaryButton(
                      useMaxSize: true,
                      isDisabled: value.text.trim().length < 4,
                      isLoading: authState.isLoading,
                      onPressed: () => _submit(profile),
                      text: isEditMode
                          ? context.loc.common_save
                          : context.loc.profile_finishSignup,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
