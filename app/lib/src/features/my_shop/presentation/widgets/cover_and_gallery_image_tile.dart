import 'dart:typed_data';

import 'package:app/src/core/common_widgets/custom_image.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// This helper widget is still needed by GalleryImagesTile
Widget _buildRemoveButton(VoidCallback onPressed) {
  return IconButton(
    constraints: const BoxConstraints(),
    padding: const EdgeInsets.all(4.0),
    icon: const CircleAvatar(
      radius: 12,
      // TODO: REMOVE HARDCODED COLORS
      backgroundColor: Colors.black54,
      child: Icon(Icons.close, color: Colors.white, size: 14),
    ),
    onPressed: onPressed,
  );
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            (hasNewImage || hasExistingImage)
                ? 'Change Cover Image'.hardcoded
                : 'Pick Cover Image *'
                      .hardcoded, // Added * to indicate required
          ),
          trailing: const Icon(Icons.image),
          onTap: _pickCoverImage,
        ),
        // Display logic: show the newly picked image, or fall back to the existing one.
        // There is no Stack and no remove button.
        if (hasNewImage)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
            child: SizedBox(
              height: 300,
              child: CustomImageWrapper(
                aspectRatio: 1,
                imageXFile: _pickedFile!,
              ),
            ),
          )
        else if (hasExistingImage)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
            child: SizedBox(
              height: 300,
              child: CustomImageWrapper(
                aspectRatio: 1,
                imageUrl: widget.coverImageUrl,
              ),
            ),
          ),
      ],
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

  Widget _buildImage(Widget image, VoidCallback onRemove) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        SizedBox(height: 300, child: image),
        _buildRemoveButton(onRemove),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasNewImages = _pickedFiles.isNotEmpty;
    final hasExistingImages = widget.galleryImagesUrl.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text('Manage Gallery Images'.hardcoded),
          trailing: const Icon(Icons.photo_library),
          onTap: _pickGalleryImages,
        ),
        if (hasExistingImages)
          _buildImageList(
            title: 'Current Images:'.hardcoded,
            itemCount: widget.galleryImagesUrl.length,
            itemBuilder: (_, index) {
              final imageUrl = widget.galleryImagesUrl[index];
              return _buildImage(
                CustomImageWrapper(aspectRatio: 1, imageUrl: imageUrl),
                () => widget.onExistingImageDeleted(imageUrl),
              );
            },
          ),
        if (hasNewImages)
          _buildImageList(
            title: 'New Images to Add:'.hardcoded,
            itemCount: _pickedFiles.length,
            itemBuilder: (_, index) {
              return _buildImage(
                CustomImageWrapper(
                  aspectRatio: 1,
                  imageXFile: _pickedFiles[index],
                ),
                () => _removeNewImage(index),
              );
            },
          ),
      ],
    );
  }

  Widget _buildImageList({
    required String title,
    required int itemCount,
    required Widget Function(BuildContext, int) itemBuilder,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(title, style: Theme.of(context).textTheme.titleSmall),
        ),
        SizedBox(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: itemCount,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: itemBuilder,
          ),
        ),
      ],
    );
  }
}
