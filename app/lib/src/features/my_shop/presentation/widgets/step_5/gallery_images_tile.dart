import 'dart:typed_data';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/services/image_compression_service.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/my_shop/presentation/widgets/step_5/gallery_image_picker_button.dart';
import 'package:app/src/features/my_shop/presentation/widgets/step_5/gallery_image_lists.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class GalleryImagesTile extends ConsumerStatefulWidget {
  final List<Uint8List> galleryImageBytes;
  final List<String> galleryImagesUrl;
  final ValueChanged<List<Uint8List>> onGalleryImagesPicked;
  final ValueChanged<String> onExistingImageDeleted;

  const GalleryImagesTile({
    super.key,
    required this.galleryImageBytes,
    required this.galleryImagesUrl,
    required this.onGalleryImagesPicked,
    required this.onExistingImageDeleted,
  });

  @override
  ConsumerState<GalleryImagesTile> createState() => _GalleryImagesTileState();
}

class _GalleryImagesTileState extends ConsumerState<GalleryImagesTile> {
  // This list now stores the compressed files
  final List<XFile> _pickedFiles = [];

  Future<void> _pickGalleryImages() async {
    final picker = ImagePicker();
    final picked = await picker.pickMultiImage();
    if (picked.isNotEmpty) {
      final currentCount = _pickedFiles.length + widget.galleryImagesUrl.length;
      final remainingCapacity = 10 - currentCount;
      if (remainingCapacity <= 0) {
        if (mounted) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Maximum 10 images allowed'.hardcoded,
                style: TextStyle(color: context.colorScheme.onError),
              ),
              backgroundColor: context.colorScheme.error,
            ),
          );
        }
        return;
      }
      final imagesToProcess = picked.take(remainingCapacity).toList();

      if (mounted) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Compressing ${imagesToProcess.length} images...'.hardcoded,
            ),
          ),
        );
      }

      final compressionService = ref.read(imageCompressionServiceProvider);
      final List<XFile> newlyCompressedFiles = [];
      for (final imageFile in imagesToProcess) {
        final compressed = await compressionService.compressImage(imageFile);
        if (compressed != null) {
          newlyCompressedFiles.add(compressed);
        }
      }

      if (newlyCompressedFiles.isEmpty) return;

      setState(() {
        _pickedFiles.addAll(newlyCompressedFiles);
      });

      final allNewBytes = await Future.wait(
        _pickedFiles.map((e) => e.readAsBytes()),
      );
      widget.onGalleryImagesPicked(allNewBytes);
    }
  }

  void _removeNewImage(int index) async {
    setState(() {
      _pickedFiles.removeAt(index);
    });
    final newBytes = await Future.wait(
      _pickedFiles.map((e) => e.readAsBytes()),
    );
    widget.onGalleryImagesPicked(newBytes);
    if (!mounted) return;
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Image removed'.hardcoded,
          style: TextStyle(color: context.colorScheme.onSurface),
        ),
        backgroundColor: context.colorScheme.surface,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void _removeExistingImage(String url) {
    widget.onExistingImageDeleted(url);
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Image marked for deletion'.hardcoded,
          style: TextStyle(color: context.colorScheme.onSurface),
        ),
        backgroundColor: context.colorScheme.surface,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasNewImages = _pickedFiles.isNotEmpty;
    final hasExistingImages = widget.galleryImagesUrl.isNotEmpty;
    final totalImages = _pickedFiles.length + widget.galleryImagesUrl.length;
    final isLimitReached = totalImages >= 10;
    final displayedImages = widget.galleryImagesUrl.take(10).toList();

    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.p8),
        side: BorderSide(
          color: context.colorScheme.outline.withAlpha(128),
          width: 1,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              context.colorScheme.surface,
              context.colorScheme.surface.withAlpha(230),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Gallery Images *'.hardcoded,
                style: context.textTheme.titleMedium,
              ),
              gapH4,
              Text(
                'Add up to 10 images to showcase your listing (16:9 ratio required)'
                    .hardcoded,
                style: context.textTheme.bodyMedium,
              ),
              gapH4,
              Text(
                '$totalImages/10 images'.hardcoded,
                style: context.textTheme.bodyMedium!.copyWith(
                  color: isLimitReached
                      ? context.colorScheme.error
                      : context.colorScheme.onSurface,
                ),
              ),
              gapH8,
              GalleryImagePickerButton(
                isLimitReached: isLimitReached,
                onPressed: _pickGalleryImages,
              ),
              if (isLimitReached) ...[
                gapH4,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
                  child: Text(
                    'Maximum 10 images reached'.hardcoded,
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: context.colorScheme.error,
                    ),
                  ),
                ),
              ],
              GalleryImageLists(
                hasNewImages: hasNewImages,
                hasExistingImages: hasExistingImages,
                displayedImages: displayedImages,
                pickedFiles: _pickedFiles,
                onRemoveExisting: _removeExistingImage,
                onRemoveNew: _removeNewImage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
