import 'package:app/src/core/common_widgets/custom_image.dart';
import 'package:app/src/core/common_widgets/custom_outlined_button.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/features/auth/presentation/controllers/profile_image_controller.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImageWidget extends ConsumerWidget {
  final String? initialImageUrl;
  final bool isLoading;

  const ProfileImageWidget({
    super.key,
    this.initialImageUrl,
    this.isLoading = false,
  });

  Future<void> _pickImage(WidgetRef ref) async {
    if (isLoading) return;
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      // Pass the XFile directly
      ref.read(profileImageControllerProvider.notifier).setImage(picked);
    }
  }

  void _removeImage(WidgetRef ref) {
    if (isLoading) return;
    ref.read(profileImageControllerProvider.notifier).removeImage();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageState = ref.watch(profileImageControllerProvider);
    final imageFile = imageState.imageFile;
    final imageRemoved = imageState.imageRemoved;

    final showImage = !imageRemoved && (imageFile != null || (initialImageUrl?.isNotEmpty ?? false));

    return Column(
      children: [
        SizedBox(
          width: 96,
          height: 96,
          child: ClipOval(
            child: showImage
                ? CustomImageWrapper(
                    fit: BoxFit.cover,
                    borderRadius: BorderRadius.circular(50),
                    imageXFile: imageFile, // Pass the XFile here
                    imageUrl: imageFile == null ? initialImageUrl : null,
                  )
                : const CircleAvatar(
                    child: Icon(Icons.person, size: 48),
                  ),
          ),
        ),
        gapH16,
        Wrap(
          spacing: Sizes.p8,
          runSpacing: Sizes.p4,
          children: [
            CustomOutlinedButton(
              onPressed: () => _pickImage(ref),
              isDisabled: isLoading,
              text: context.loc.profile_uploadPhoto,
            ),
            CustomOutlinedButton(
              onPressed: () => _removeImage(ref),
              isDisabled: isLoading || !showImage,
              text: context.loc.profile_removePhoto,
            ),
          ],
        ),
      ],
    );
  }
}