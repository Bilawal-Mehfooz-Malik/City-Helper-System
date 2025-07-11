import 'dart:typed_data';

import 'package:app/src/core/common_widgets/custom_image.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CoverImageTile extends StatefulWidget {
  final Uint8List? coverImageBytes;
  final ValueChanged<Uint8List?> onCoverImagePicked;

  const CoverImageTile({
    super.key,
    required this.coverImageBytes,
    required this.onCoverImagePicked,
  });

  @override
  State<CoverImageTile> createState() => _CoverImageTileState();
}

class _CoverImageTileState extends State<CoverImageTile> {
  String? coverImagePath;

  Future<void> _pickCoverImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      final bytes = await picked.readAsBytes();
      coverImagePath = picked.path;
      widget.onCoverImagePicked(bytes);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            widget.coverImageBytes == null
                ? 'Pick Cover Image'.hardcoded
                : 'Cover Selected'.hardcoded,
          ),
          trailing: const Icon(Icons.image),
          onTap: _pickCoverImage,
        ),
        if (widget.coverImageBytes != null)
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

class GalleryImagesTile extends StatefulWidget {
  final List<Uint8List> galleryImageBytes;
  final ValueChanged<List<Uint8List>> onGalleryImagesPicked;

  const GalleryImagesTile({
    super.key,
    required this.galleryImageBytes,
    required this.onGalleryImagesPicked,
  });

  @override
  State<GalleryImagesTile> createState() => _GalleryImagesTileState();
}

class _GalleryImagesTileState extends State<GalleryImagesTile> {
  List<String> galleryImagesPath = [];

  Future<void> _pickGalleryImages() async {
    final picker = ImagePicker();
    final picked = await picker.pickMultiImage();
    if (picked.isNotEmpty) {
      final List<Uint8List> bytes = await Future.wait(
        picked.map((e) => e.readAsBytes()),
      );
      galleryImagesPath = await Future.wait(picked.map((e) async => e.path));
      widget.onGalleryImagesPicked(bytes);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            widget.galleryImageBytes.isEmpty
                ? 'Pick Gallery Images'.hardcoded
                : '${widget.galleryImageBytes.length} Images Selected'
                      .hardcoded,
          ),
          trailing: const Icon(Icons.photo_library),
          onTap: _pickGalleryImages,
        ),
        if (widget.galleryImageBytes.isNotEmpty)
          SizedBox(
            height: 120,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: widget.galleryImageBytes.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, index) => SizedBox(
                height: 300,
                child: CustomImage(
                  aspectRatio: 1,
                  imageXFile: XFile(galleryImagesPath[index]),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
