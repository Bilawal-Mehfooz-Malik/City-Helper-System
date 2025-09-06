import 'package:app/src/core/common_widgets/responsive_scrollable.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/features/my_shop/domain/shop_form.dart';
import 'package:app/src/features/my_shop/presentation/controllers/shop_form_wizard_controller.dart';
import 'package:app/src/features/my_shop/presentation/widgets/step_5/cover_image_tile.dart';
import 'package:app/src/features/my_shop/presentation/widgets/step_5/gallery_images_tile.dart';
import 'package:app/src/features/my_shop/presentation/widgets/step_5/menu_images_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step5MediaPage extends StatelessWidget {
  final ShopFormWizardControllerProvider wizardProvider;
  final String? initialCoverUrl;
  final List<String> initialGalleryUrls;
  final List<String> initialMenuUrls;

  const Step5MediaPage({
    super.key,
    required this.wizardProvider,
    this.initialCoverUrl,
    required this.initialGalleryUrls,
    required this.initialMenuUrls,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveScrollable(
      padding: const EdgeInsets.all(Sizes.p16),
      child: _Step5MediaForm(
        wizardProvider: wizardProvider,
        initialCoverUrl: initialCoverUrl,
        initialGalleryUrls: initialGalleryUrls,
        initialMenuUrls: initialMenuUrls,
      ),
    );
  }
}

class _Step5MediaForm extends ConsumerWidget {
  final ShopFormWizardControllerProvider wizardProvider;
  final String? initialCoverUrl;
  final List<String> initialGalleryUrls;
  final List<String> initialMenuUrls;

  const _Step5MediaForm({
    required this.wizardProvider,
    this.initialCoverUrl,
    required this.initialGalleryUrls,
    required this.initialMenuUrls,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wizardState = ref.watch(wizardProvider);
    final wizardController = ref.read(wizardProvider.notifier);
    final ShopForm formData = wizardState.formData;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CoverImageTile(
          coverImageBytes: formData.coverImageBytes,
          coverImageUrl: initialCoverUrl,
          onCoverImagePicked: (bytes) => wizardController.updateFormData(
            formData.copyWith(coverImageBytes: bytes),
          ),
        ),
        gapH12,
        GalleryImagesTile(
          galleryImageBytes: formData.galleryImageBytes,
          galleryImagesUrl: initialGalleryUrls
              .where((url) => !formData.galleryUrlsToDelete.contains(url))
              .toList(),
          onGalleryImagesPicked: (bytesList) => wizardController.updateFormData(
            formData.copyWith(galleryImageBytes: bytesList),
          ),
          onExistingImageDeleted: (url) {
            final updatedUrls = List<String>.from(formData.galleryUrlsToDelete)
              ..add(url);
            wizardController.updateFormData(
              formData.copyWith(galleryUrlsToDelete: updatedUrls),
            );
          },
        ),
        if (formData.category?.id == 2) ...[
          gapH12,
          MenuImagesTile(
            menuImageBytes: formData.menuImageBytes,
            menuImagesUrl: initialMenuUrls
                .where((url) => !formData.menuUrlsToDelete.contains(url))
                .toList(),
            onMenuImagesPicked: (bytesList) => wizardController.updateFormData(
              formData.copyWith(menuImageBytes: bytesList),
            ),
            onExistingImageDeleted: (url) {
              final updatedUrls = List<String>.from(formData.menuUrlsToDelete)
                ..add(url);
              wizardController.updateFormData(
                formData.copyWith(menuUrlsToDelete: updatedUrls),
              );
            },
          ),
        ],
      ],
    );
  }
}
