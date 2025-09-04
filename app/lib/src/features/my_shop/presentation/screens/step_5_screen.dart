import 'package:app/src/core/common_widgets/responsive_scrollable.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/features/my_shop/domain/shop_form.dart';
import 'package:app/src/features/my_shop/presentation/controllers/shop_form_wizard_controller.dart';
import 'package:app/src/features/my_shop/presentation/widgets/cover_and_gallery_image_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step5MediaPage extends ConsumerWidget {
  final ShopFormWizardControllerProvider wizardProvider;
  final String? initialCoverUrl;
  final List<String> initialGalleryUrls;

  const Step5MediaPage({
    super.key,
    required this.wizardProvider,
    this.initialCoverUrl,
    required this.initialGalleryUrls,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wizardState = ref.watch(wizardProvider);
    final wizardController = ref.read(wizardProvider.notifier);
    final ShopForm formData = wizardState.formData;

    return ResponsiveScrollable(
      padding: const EdgeInsets.all(Sizes.p16),
      child: Column(
        spacing: Sizes.p12,
        children: [
          CoverImageTile(
            coverImageBytes: formData.coverImageBytes,
            coverImageUrl: initialCoverUrl,
            onCoverImagePicked: (bytes) => wizardController.updateFormData(
              formData.copyWith(coverImageBytes: bytes),
            ),
          ),
          GalleryImagesTile(
            galleryImageBytes: formData.galleryImageBytes,
            galleryImagesUrl: initialGalleryUrls
                .where((url) => !formData.galleryUrlsToDelete.contains(url))
                .toList(),
            onGalleryImagesPicked: (bytesList) =>
                wizardController.updateFormData(
                  formData.copyWith(galleryImageBytes: bytesList),
                ),
            onExistingImageDeleted: (url) {
              final updatedUrls = List<String>.from(
                formData.galleryUrlsToDelete,
              )..add(url);
              wizardController.updateFormData(
                formData.copyWith(galleryUrlsToDelete: updatedUrls),
              );
            },
          ),
        ],
      ),
    );
  }
}
