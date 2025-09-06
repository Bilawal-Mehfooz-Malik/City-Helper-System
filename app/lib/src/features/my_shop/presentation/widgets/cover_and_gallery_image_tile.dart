import 'dart:typed_data';
import 'package:app/src/core/common_widgets/custom_image.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RemoveButton extends StatelessWidget {
  final VoidCallback onPressed;

  const RemoveButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: const BoxConstraints(),
      padding: const EdgeInsets.all(Sizes.p4),
      icon: CircleAvatar(
        radius: 20,
        backgroundColor: context.colorScheme.surface.withValues(alpha: 0.8),
        child: Icon(Icons.close, color: context.colorScheme.error, size: 22),
      ),
      onPressed: onPressed,
    );
  }
}

class ImagePreview extends StatelessWidget {
  final Widget image;
  final VoidCallback onRemove;
  final double height;
  final double width;

  const ImagePreview({
    super.key,
    required this.image,
    required this.onRemove,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizes.p8),
            boxShadow: [
              BoxShadow(
                color: context.colorScheme.onSurface.withValues(alpha: 0.2),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
            border: Border.all(
              color: context.colorScheme.outline.withValues(alpha: 0.5),
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.p8),
            child: SizedBox(height: height, width: width, child: image),
          ),
        ),
        RemoveButton(onPressed: onRemove),
      ],
    );
  }
}

class ImageListSection extends StatelessWidget {
  final String title;
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;

  const ImageListSection({
    super.key,
    required this.title,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
          child: Text(title, style: context.textTheme.bodyMedium),
        ),
        gapH8,
        SizedBox(
          height: 135,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
            itemCount: itemCount,
            separatorBuilder: (context, _) => gapW12,
            itemBuilder: itemBuilder,
          ),
        ),
      ],
    );
  }
}

class CoverImageTile extends StatefulWidget {
  final Uint8List? coverImageBytes;
  final String? coverImageUrl;
  final ValueChanged<Uint8List?> onCoverImagePicked;

  const CoverImageTile({
    super.key,
    required this.coverImageBytes,
    required this.onCoverImagePicked,
    this.coverImageUrl,
  });

  @override
  State<CoverImageTile> createState() => _CoverImageTileState();
}

class _CoverImageTileState extends State<CoverImageTile> {
  XFile? _pickedFile;

  Future<void> _pickCoverImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      final bytes = await picked.readAsBytes();
      setState(() {
        _pickedFile = picked;
      });
      widget.onCoverImagePicked(bytes);
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasNewImage = widget.coverImageBytes != null && _pickedFile != null;
    final hasExistingImage =
        widget.coverImageUrl != null && widget.coverImageUrl!.isNotEmpty;

    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.p8),
        side: BorderSide(
          color: context.colorScheme.outline.withValues(alpha: 0.5),
          width: 1,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              context.colorScheme.surface,
              context.colorScheme.surface.withValues(alpha: 0.9),
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
                'Cover Image *'.hardcoded,
                style: context.textTheme.titleMedium,
              ),
              gapH4,
              Text(
                'Select a cover image (4:3 ratio required)'.hardcoded,
                style: context.textTheme.bodyMedium,
              ),
              gapH8,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _pickCoverImage,
                  icon: Icon(Icons.image, color: context.colorScheme.onPrimary),
                  label: Text(
                    (hasNewImage || hasExistingImage)
                        ? 'Change Cover Image'.hardcoded
                        : 'Pick Cover Image *'.hardcoded,
                    style: TextStyle(color: context.colorScheme.onPrimary),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.colorScheme.primary,
                    foregroundColor: context.colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Sizes.p8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.p16,
                      vertical: Sizes.p12,
                    ),
                  ),
                ),
              ),
              if (hasNewImage || hasExistingImage) ...[
                gapH12,
                LayoutBuilder(
                  builder: (context, constraints) {
                    const maxWidth = 600.0; // Constrain for large screens
                    final availableWidth = constraints.maxWidth - Sizes.p8 * 2;
                    final imageWidth = availableWidth.clamp(0.0, maxWidth);
                    final imageHeight = imageWidth * 3 / 4; // 4:3 ratio
                    return Center(
                      child: ImagePreview(
                        image: CustomImageWrapper(
                          aspectRatio: 4 / 3,
                          imageXFile: hasNewImage ? _pickedFile! : null,
                          imageUrl: hasNewImage ? null : widget.coverImageUrl,
                        ),
                        onRemove: () {
                          setState(() {
                            _pickedFile = null;
                          });
                          widget.onCoverImagePicked(null);
                        },
                        height: imageHeight,
                        width: imageWidth,
                      ),
                    );
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class GalleryImagesTile extends StatefulWidget {
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
  State<GalleryImagesTile> createState() => _GalleryImagesTileState();
}

class _GalleryImagesTileState extends State<GalleryImagesTile> {
  final List<XFile> _pickedFiles = [];

  Future<void> _pickGalleryImages() async {
    final picker = ImagePicker();
    final picked = await picker.pickMultiImage();
    if (picked.isNotEmpty) {
      setState(() {
        _pickedFiles.addAll(picked);
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
  }

  @override
  Widget build(BuildContext context) {
    final hasNewImages = _pickedFiles.isNotEmpty;
    final hasExistingImages = widget.galleryImagesUrl.isNotEmpty;

    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.p8),
        side: BorderSide(
          color: context.colorScheme.outline.withValues(alpha: 0.5),
          width: 1,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              context.colorScheme.surface,
              context.colorScheme.surface.withValues(alpha: 0.9),
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
                'Add images to showcase your listing (16:9 ratio required)'
                    .hardcoded,
                style: context.textTheme.bodyMedium,
              ),
              gapH8,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _pickGalleryImages,
                  icon: Icon(
                    Icons.photo_library,
                    color: context.colorScheme.onPrimary,
                  ),
                  label: Text(
                    'Add Gallery Images *'.hardcoded,
                    style: TextStyle(color: context.colorScheme.onPrimary),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.colorScheme.primary,
                    foregroundColor: context.colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Sizes.p8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.p16,
                      vertical: Sizes.p12,
                    ),
                  ),
                ),
              ),
              if (hasExistingImages)
                ImageListSection(
                  title: 'Current Images'.hardcoded,
                  itemCount: widget.galleryImagesUrl.length,
                  itemBuilder: (context, index) {
                    final imageUrl = widget.galleryImagesUrl[index];
                    return ImagePreview(
                      image: CustomImageWrapper(
                        aspectRatio: 16 / 9,
                        imageUrl: imageUrl,
                      ),
                      onRemove: () => widget.onExistingImageDeleted(imageUrl),
                      height: 135.0,
                      width: 135.0 * 16 / 9, // ~240.0
                    );
                  },
                ),
              if (hasNewImages) ...[
                gapH4,
                ImageListSection(
                  title: 'New Images to Add'.hardcoded,
                  itemCount: _pickedFiles.length,
                  itemBuilder: (context, index) {
                    return ImagePreview(
                      image: CustomImageWrapper(
                        aspectRatio: 16 / 9,
                        imageXFile: _pickedFiles[index],
                      ),
                      onRemove: () => _removeNewImage(index),
                      height: 135.0,
                      width: 135.0 * 16 / 9, // ~240.0
                    );
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
