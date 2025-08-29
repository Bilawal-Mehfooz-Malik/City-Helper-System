import 'dart:typed_data';

import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/common_widgets/custom_progress_indicator.dart';
import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/features/auth/data/user_repository.dart';
import 'package:app/src/features/auth/domain/app_user.dart';
import 'package:app/src/features/auth/presentation/widgets/profile_image_widget.dart';
import 'package:app/src/features/startup/data/real/user_location_repository.dart';
import 'package:app/src/features/startup/presentation/controllers/google_map_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

import 'package:app/src/core/common_widgets/custom_text_field.dart';
import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/async_value_ui.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/core/utils/default_location_provider.dart';
import 'package:app/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:app/src/features/startup/presentation/controllers/user_location_controller.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/routers/app_router.dart';

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
  XFile? _pickedImage;
  Uint8List? _pickedImageBytes;
  bool _removeImage = false;
  late final TextEditingController _nameController; // Marked as late final
  bool _isProfileLoaded = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(); // Initialize here
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

    final controller = ref.read(authControllerProvider.notifier);
    final user = ref.read(authStateChangesProvider).value;

    if (user == null) {
      return;
    }

    final bool isEditMode = existingProfile != null;

    if (isEditMode) {
      final isNameUnchanged = name == existingProfile.name;
      final isImageUnchanged = _pickedImageBytes == null && !_removeImage;

      if (isNameUnchanged && isImageUnchanged) {
        if (mounted) context.pop();
        return;
      }
    }

    final result = isEditMode
        ? await controller.updateUser(
            name: name,
            profileImageBytes: _pickedImageBytes,
            removeProfileImage: _removeImage,
          )
        : await controller.createUser(
            name: name,
            profileImageBytes: _pickedImageBytes,
          );

    if (!mounted) {
      return;
    }

    if (result.hasError) {
      result.showAlertDialogOnError(context);
    } else {
      context.pop();
    }
  }

  void _onImageChanged(XFile? file) async {
    if (file == null) {
      setState(() {
        _pickedImage = null;
        _pickedImageBytes = null;
      });
      return;
    }

    final bytes = await file.readAsBytes();

    setState(() {
      _pickedImage = file;
      _pickedImageBytes = bytes;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final user = ref.watch(authStateChangesProvider).value;
    final savedUserLocation = ref.watch(fetchUserLocationProvider).value;
    final userLocation = ref.watch(userLocationControllerProvider).value;
    final defaultLocation = ref.watch(defaultLocationProvider);
    final mapBuilder = ref.watch(googleMapBuilderProvider);

    final profileValue = user != null
        ? ref.watch(fetchUserByIdProvider(user.uid))
        : const AsyncValue<AppUser?>.data(null);

    return AsyncValueWidget(
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

        if (isEditMode && !_isProfileLoaded) {
          _nameController.text = profile.name;
          _isProfileLoaded = true; // Mark as loaded
        } else if (!isEditMode) {
          _nameController.clear();
          _isProfileLoaded = false; // Reset for create mode
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(Sizes.p16),
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
                initialImageFile: _pickedImage,
                isLoading: authState.isLoading,
                onImageChanged: _onImageChanged,
                onImageRemoved: () {
                  setState(() {
                    _pickedImage = null;
                    _pickedImageBytes = null;
                    _removeImage = true;
                  });
                },
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
                hintText: context.loc.profile_fullNameHint,
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
              InkWell(
                onTap: authState.isLoading
                    ? null
                    : () async {
                        final result = await context.pushNamed<LatLng>(
                          AppRoute.pickYourLocation.name,
                        );
                        if (result == null) return;
                        ref
                            .read(userLocationControllerProvider.notifier)
                            .getLocationFromMap(result);
                      },
                child: AbsorbPointer(
                  absorbing: !authState.isLoading,
                  child: SizedBox(
                    height: 200,
                    child: mapBuilder(
                      profile?.lastLocation ??
                          savedUserLocation ??
                          userLocation ??
                          defaultLocation,
                    ),
                  ),
                ),
              ),

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
    );
  }
}
