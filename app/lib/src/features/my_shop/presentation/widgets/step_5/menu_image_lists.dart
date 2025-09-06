import 'package:app/src/core/common_widgets/custom_image.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/features/my_shop/presentation/widgets/step_5/image_list_section.dart';
import 'package:app/src/features/my_shop/presentation/widgets/step_5/image_preview.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MenuImageLists extends StatelessWidget {
  final bool hasNewImages;
  final bool hasExistingImages;
  final List<String> displayedImages;
  final List<XFile> pickedFiles;
  final void Function(String) onRemoveExisting;
  final void Function(int) onRemoveNew;

  const MenuImageLists({
    super.key,
    required this.hasNewImages,
    required this.hasExistingImages,
    required this.displayedImages,
    required this.pickedFiles,
    required this.onRemoveExisting,
    required this.onRemoveNew,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasExistingImages)
          ImageListSection(
            title: 'Current Images'.hardcoded,
            itemCount: displayedImages.length,
            itemBuilder: (context, index) {
              final imageUrl = displayedImages[index];
              return ImagePreview(
                image: CustomImageWrapper(
                  aspectRatio: 3 / 4,
                  imageUrl: imageUrl,
                ),
                onRemove: () => onRemoveExisting(imageUrl),
                height: 180.0,
                width: 180.0 * 3 / 4, // 135.0
              );
            },
          ),
        if (hasNewImages) ...[
          gapH4,
          ImageListSection(
            title: 'New Images to Add'.hardcoded,
            itemCount: pickedFiles.length,
            itemBuilder: (context, index) {
              return ImagePreview(
                image: CustomImageWrapper(
                  aspectRatio: 3 / 4,
                  imageXFile: pickedFiles[index],
                ),
                onRemove: () => onRemoveNew(index),
                height: 180.0,
                width: 180.0 * 3 / 4, // 135.0
              );
            },
          ),
        ],
      ],
    );
  }
}
