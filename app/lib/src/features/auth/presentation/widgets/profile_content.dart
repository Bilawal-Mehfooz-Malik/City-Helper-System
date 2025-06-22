import 'dart:io';
import 'package:app/src/features/startup/presentation/controllers/google_map_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

import 'package:app/src/core/common_widgets/custom_outlined_button.dart';
import 'package:app/src/core/common_widgets/custom_text_field.dart';
import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/async_value_ui.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/core/utils/default_location_provider.dart';
import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:app/src/features/startup/presentation/controllers/user_location_controller.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/routers/app_router.dart';

class ProfileContent extends ConsumerStatefulWidget {
  final String phoneNumber;

  const ProfileContent({super.key, required this.phoneNumber});

  @override
  ConsumerState<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends ConsumerState<ProfileContent> {
  final _nameController = TextEditingController();
  final _nameFocusNode = FocusNode();
  final _imageNotifier = ValueNotifier<XFile?>(null);
  final _imageRemovedNotifier = ValueNotifier<bool>(false);
  String? _existingImageUrl;

  @override
  void dispose() {
    _nameController.dispose();
    _nameFocusNode.dispose();
    _imageNotifier.dispose();
    _imageRemovedNotifier.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final user = ref.read(authStateChangesProvider).value;

    if (_nameController.text.isEmpty && user?.name != null) {
      _nameController.text = user!.name;
    }
    if (_existingImageUrl == null && user?.profileImageUrl != null) {
      _existingImageUrl = user!.profileImageUrl;
    }
  }

  Future<void> _submitProfile({required bool isEdit}) async {
    final name = _nameController.text.trim();
    if (name.length < 4) return;

    final controller = ref.read(authControllerProvider.notifier);
    final result = isEdit
        ? await controller.updateProfile(
            name: name,
            profilePicUrl: _imageRemovedNotifier.value
                ? ''
                : _imageNotifier.value?.path,
          )
        : await controller.completeSignup(
            name: name,
            profilePicUrl: _imageRemovedNotifier.value
                ? ''
                : _imageNotifier.value?.path,
          );

    if (result.hasError && mounted) {
      result.showAlertDialogOnError(context);
      return;
    }

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isEdit
                ? context.loc.profile_updateSuccessMessage
                : context.loc.profile_createSuccessMessage,
          ),
        ),
      );
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final user = ref.read(authStateChangesProvider).value;
    final defaultLocation = ref.watch(defaultLocationProvider);
    final userLocation = ref.watch(userLocationControllerProvider).value;

    final isEdit = user?.name != null;
    final isFormFilled = _nameController.text.trim().length >= 4;

    return SingleChildScrollView(
      child: Column(
        spacing: Sizes.p16,
        mainAxisSize: MainAxisSize.min,
        children: [
          _ProfileHeaderWidget(isEditMode: isEdit),
          _ProfileImageWidget(
            imageNotifier: _imageNotifier,
            imageRemovedNotifier: _imageRemovedNotifier,
            existingImageUrl: _existingImageUrl,
            isLoading: authState.isLoading,
          ),
          _ProfileFormWidget(
            onchanged: (p0) => setState(() {}),
            nameController: _nameController,
            nameFocusNode: _nameFocusNode,
            onLocationPressed: () =>
                context.pushNamed(AppRoute.pickYourLocation.name),
            isLoading: authState.isLoading,
            userLocation: userLocation,
            defaultLocation: defaultLocation,
          ),
          PrimaryButton(
            useMaxSize: true,
            isDisabled: !isFormFilled,
            isLoading: authState.isLoading,
            onPressed: () => _submitProfile(isEdit: isEdit),
            text: isEdit
                ? context.loc.common_save
                : context.loc.profile_finishSignup,
          ),
          gapH8,
        ],
      ),
    );
  }
}

class _ProfileHeaderWidget extends ConsumerWidget {
  final bool isEditMode;

  const _ProfileHeaderWidget({required this.isEditMode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text(
          isEditMode
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
      ],
    );
  }
}

class _ProfileImageWidget extends ConsumerStatefulWidget {
  final ValueNotifier<XFile?> imageNotifier;
  final ValueNotifier<bool> imageRemovedNotifier;
  final String? existingImageUrl;
  final bool isLoading;

  const _ProfileImageWidget({
    required this.imageNotifier,
    required this.imageRemovedNotifier,
    required this.existingImageUrl,
    required this.isLoading,
  });

  @override
  ConsumerState<_ProfileImageWidget> createState() =>
      _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends ConsumerState<_ProfileImageWidget> {
  final _picker = ImagePicker();

  Future<void> _uploadPhoto() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null && mounted) {
      widget.imageNotifier.value = pickedFile;
      widget.imageRemovedNotifier.value = false;
    }
  }

  void _removePhoto() {
    if (mounted) {
      widget.imageNotifier.value = null;
      widget.imageRemovedNotifier.value = true;
    }
  }

  ImageProvider? _getProfileImageProvider() {
    if (widget.imageNotifier.value != null) {
      return kIsWeb
          ? NetworkImage(widget.imageNotifier.value!.path)
          : FileImage(File(widget.imageNotifier.value!.path));
    }
    if (!widget.imageRemovedNotifier.value &&
        widget.existingImageUrl != null &&
        widget.existingImageUrl!.isNotEmpty) {
      return NetworkImage(widget.existingImageUrl!);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
              isDisabled: widget.isLoading,
              text: context.loc.profile_uploadPhoto,
            ),
            CustomOutlinedButton(
              onPressed: _removePhoto,
              isDisabled:
                  widget.isLoading ||
                  (widget.imageNotifier.value == null &&
                      (widget.existingImageUrl == null ||
                          widget.imageRemovedNotifier.value)),
              text: context.loc.profile_removePhoto,
            ),
          ],
        ),
      ],
    );
  }
}

class _ProfileFormWidget extends ConsumerWidget {
  final TextEditingController nameController;
  final FocusNode nameFocusNode;
  final VoidCallback onLocationPressed;
  final bool isLoading;
  final LatLng? userLocation;
  final LatLng defaultLocation;
  final void Function(String)? onchanged;

  const _ProfileFormWidget({
    required this.nameController,
    required this.nameFocusNode,
    required this.onLocationPressed,
    required this.isLoading,
    required this.userLocation,
    required this.defaultLocation,
    required this.onchanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapBuilder = ref.watch(googleMapBuilderProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.loc.profile_fullNameLabel,
          style: context.textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        gapH4,
        CustomTextField(
          onchanged: onchanged,
          focusNode: nameFocusNode,
          controller: nameController,
          hintText: context.loc.profile_fullNameHint,
          keyboardType: TextInputType.name,
        ),
        gapH16,
        Text(
          context.loc.account_yourLocation,
          style: context.textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        gapH8,
        GestureDetector(
          onTap: isLoading ? null : onLocationPressed,
          child: AbsorbPointer(
            child: SizedBox(
              height: 250,
              child: mapBuilder(userLocation ?? defaultLocation),
            ),
          ),
        ),
      ],
    );
  }
}
