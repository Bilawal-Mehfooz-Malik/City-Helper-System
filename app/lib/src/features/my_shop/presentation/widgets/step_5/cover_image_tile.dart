import 'dart:typed_data';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/my_shop/presentation/widgets/step_5/cover_image_picker_button.dart';
import 'package:app/src/features/my_shop/presentation/widgets/step_5/cover_image_preview.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
    final hasImage = hasNewImage || hasExistingImage;

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
                'Cover Image *'.hardcoded,
                style: context.textTheme.titleMedium,
              ),
              gapH4,
              Text(
                'Select a cover image (4:3 ratio required)'.hardcoded,
                style: context.textTheme.bodyMedium,
              ),
              gapH8,
              CoverImagePickerButton(
                hasImage: hasImage,
                onPressed: _pickCoverImage,
              ),
              if (hasImage) ...[
                gapH12,
                CoverImagePreview(
                  pickedFile: hasNewImage ? _pickedFile : null,
                  imageUrl: hasNewImage ? null : widget.coverImageUrl,
                  onRemove: () {
                    setState(() {
                      _pickedFile = null;
                    });
                    widget.onCoverImagePicked(null);
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
