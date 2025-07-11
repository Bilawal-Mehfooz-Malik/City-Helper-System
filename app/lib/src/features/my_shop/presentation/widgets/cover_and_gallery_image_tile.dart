// lib/features/my_shop/presentation/widgets/cover_and_gallery_image_tile.dart

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:app/src/core/common_widgets/custom_image.dart';
import 'package:app/src/localization/string_hardcoded.dart';

// --- Cover Image Widget ---
class CoverImageTile extends StatelessWidget {
  final String? existingImageUrl;
  final Uint8List? newImageBytes;
  final bool isDeleted;
  final ValueChanged<Uint8List> onImagePicked;
  final VoidCallback onImageRemoved;

  const CoverImageTile({
    super.key,
    this.existingImageUrl,
    this.newImageBytes,
    required this.isDeleted,
    required this.onImagePicked,
    required this.onImageRemoved,
  });

  Future<void> _pickCoverImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );
    if (picked != null) {
      onImagePicked(await picked.readAsBytes());
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget imageDisplay;
    bool hasImage = false;

    // Determine what image to show
    if (newImageBytes != null) {
      hasImage = true;
      imageDisplay = CustomImage(bytes: newImageBytes);
    } else if (existingImageUrl != null && !isDeleted) {
      hasImage = true;
      imageDisplay = CustomImage(imageUrl: existingImageUrl);
    } else {
      imageDisplay = const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            hasImage ? 'Cover Image'.hardcoded : 'Pick Cover Image *'.hardcoded,
          ),
          trailing: hasImage
              ? IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.red),
                  onPressed: onImageRemoved,
                )
              : const Icon(Icons.add_a_photo_outlined),
          onTap: _pickCoverImage,
        ),
        if (hasImage)
          SizedBox(
            height: 200,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: imageDisplay,
            ),
          ),
      ],
    );
  }
}

// --- Gallery Images Widget ---
class GalleryImagesTile extends StatelessWidget {
  final List<String> existingImageUrls;
  final List<Uint8List> newImageBytes;
  final List<String> urlsToDelete;
  final ValueChanged<List<Uint8List>> onImagesPicked;
  final ValueChanged<String> onRemoveExisting;
  final ValueChanged<int> onRemoveNew;

  const GalleryImagesTile({
    super.key,
    required this.existingImageUrls,
    required this.newImageBytes,
    required this.urlsToDelete,
    required this.onImagesPicked,
    required this.onRemoveExisting,
    required this.onRemoveNew,
  });

  Future<void> _pickGalleryImages() async {
    final picker = ImagePicker();
    final picked = await picker.pickMultiImage(imageQuality: 70);
    if (picked.isNotEmpty) {
      final List<Uint8List> bytesList = await Future.wait(
        picked.map((e) => e.readAsBytes()),
      );
      onImagesPicked(bytesList);
    }
  }

  @override
  Widget build(BuildContext context) {
    final visibleExistingUrls = existingImageUrls
        .where((url) => !urlsToDelete.contains(url))
        .toList();
    final totalImageCount = visibleExistingUrls.length + newImageBytes.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            totalImageCount == 0
                ? 'Pick Gallery Images'.hardcoded
                : '$totalImageCount Gallery Images'.hardcoded,
          ),
          trailing: const Icon(Icons.add_photo_alternate_outlined),
          onTap: _pickGalleryImages,
        ),
        if (totalImageCount > 0)
          SizedBox(
            height: 120,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: totalImageCount,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                // Display existing images first
                if (index < visibleExistingUrls.length) {
                  final url = visibleExistingUrls[index];
                  return _buildImageThumbnail(
                    image: CustomImage(imageUrl: url),
                    onRemove: () => onRemoveExisting(url),
                  );
                }
                // Then display new images
                final newImageIndex = index - visibleExistingUrls.length;
                final bytes = newImageBytes[newImageIndex];
                return _buildImageThumbnail(
                  image: CustomImage(bytes: bytes),
                  onRemove: () => onRemoveNew(newImageIndex),
                );
              },
            ),
          ),
      ],
    );
  }

  Widget _buildImageThumbnail({
    required Widget image,
    required VoidCallback onRemove,
  }) {
    return SizedBox(
      width: 120,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(8), child: image),
          Positioned(
            top: 2,
            right: 2,
            child: Material(
              color: Colors.black.withOpacity(0.6),
              shape: const CircleBorder(),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: onRemove,
                child: const Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Icon(Icons.close, color: Colors.white, size: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
