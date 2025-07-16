import 'package:app/src/core/common_widgets/responsive_scrollable.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/features/my_shop/domain/shop_form.dart';
import 'package:app/src/features/my_shop/presentation/controllers/shop_form_wizard_controller.dart';
import 'package:app/src/features/my_shop/presentation/widgets/location_and_media_section.dart';
import 'package:app/src/features/my_shop/presentation/widgets/social_media_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step2Screen extends ConsumerWidget {
  final GlobalKey<FormState> formKey;
  final String? initialCoverUrl;
  final List<String> initialGalleryUrls;
  // This page only needs the data required to find the correct provider instance.
  final ShopForm initialForm;

  const Step2Screen({
    super.key,
    required this.formKey,
    this.initialCoverUrl,
    required this.initialGalleryUrls,
    required this.initialForm,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the correct provider instance for this form session.
    final wizardProvider = shopFormWizardControllerProvider(initialForm);

    final wizardState = ref.watch(wizardProvider);
    final wizardController = ref.read(wizardProvider.notifier);
    final ShopForm formData = wizardState.formData;

    return Form(
      key: formKey,
      child: ResponsiveScrollable(
        padding: const EdgeInsets.all(Sizes.p16),
        child: Column(
          spacing: Sizes.p12,
          children: [
            LocationAndMediaSection(
              pickedLatLng: formData.latLng,
              coverImageBytes: formData.coverImageBytes,
              galleryImagesBytes: formData.galleryImageBytes,
              openingHours: formData.openingHours,
              coverImageUrl: initialCoverUrl,
              galleryImageUrls: initialGalleryUrls
                  .where((url) => !formData.galleryUrlsToDelete.contains(url))
                  .toList(),
              onLocationPicked: (latLng) => wizardController.updateFormData(
                formData.copyWith(latLng: latLng),
              ),
              onCoverImagePicked: (bytes) => wizardController.updateFormData(
                formData.copyWith(coverImageBytes: bytes),
              ),
              onGalleryImagesPicked: (bytesList) =>
                  wizardController.updateFormData(
                    formData.copyWith(galleryImageBytes: bytesList),
                  ),
              onOpeningHoursChanged: (hours) => wizardController.updateFormData(
                formData.copyWith(openingHours: hours),
              ),
              onExistingGalleryImageDeleted: (url) {
                final updatedUrls = List<String>.from(
                  formData.galleryUrlsToDelete,
                )..add(url);
                wizardController.updateFormData(
                  formData.copyWith(galleryUrlsToDelete: updatedUrls),
                );
              },
            ),
            SocialMediaSection(
              facebook: formData.facebookUrl,
              instagram: formData.instagramUrl,
              website: formData.websiteUrl,
              onFacebookChanged: (val) => wizardController.updateFormData(
                formData.copyWith(facebookUrl: val),
              ),
              onInstagramChanged: (val) => wizardController.updateFormData(
                formData.copyWith(instagramUrl: val),
              ),
              onWebsiteChanged: (val) => wizardController.updateFormData(
                formData.copyWith(websiteUrl: val),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
