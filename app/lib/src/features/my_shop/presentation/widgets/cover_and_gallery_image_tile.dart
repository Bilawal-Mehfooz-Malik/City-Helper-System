import 'package:app/src/core/common_widgets/custom_image.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CoverImageTile extends StatelessWidget {
  final String? coverImagePath;
  final ValueChanged<String?> onCoverImagePicked;

  const CoverImageTile({
    super.key,
    required this.coverImagePath,
    required this.onCoverImagePicked,
  });

  Future<void> _pickCoverImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      onCoverImagePicked(picked.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            coverImagePath == null
                ? 'Pick Cover Image'.hardcoded
                : 'Cover Selected'.hardcoded,
          ),
          trailing: const Icon(Icons.image),
          onTap: _pickCoverImage,
        ),
        if (coverImagePath != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
            child: SizedBox(
              height: 300,
              child: CustomImage(
                aspectRatio: 1,
                imageXFile: XFile(coverImagePath!),
              ),
            ),
          ),
      ],
    );
  }
}

class GalleryImagesTile extends StatelessWidget {
  final List<String> galleryImagePaths;
  final ValueChanged<List<String>> onGalleryImagesPicked;

  const GalleryImagesTile({
    super.key,
    required this.galleryImagePaths,
    required this.onGalleryImagesPicked,
  });

  Future<void> _pickGalleryImages() async {
    final picker = ImagePicker();
    final picked = await picker.pickMultiImage();
    if (picked.isNotEmpty) {
      onGalleryImagesPicked(picked.map((e) => e.path).toList());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            galleryImagePaths.isEmpty
                ? 'Pick Gallery Images'.hardcoded
                : '${galleryImagePaths.length} Images Selected'.hardcoded,
          ),
          trailing: const Icon(Icons.photo_library),
          onTap: _pickGalleryImages,
        ),
        if (galleryImagePaths.isNotEmpty)
          SizedBox(
            height: 120,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: galleryImagePaths.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, index) => SizedBox(
                height: 300,
                child: CustomImage(
                  aspectRatio: 1,
                  imageXFile: XFile(galleryImagePaths[index]),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
