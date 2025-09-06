import 'package:app/src/core/common_widgets/custom_image.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/features/my_shop/presentation/widgets/step_5/image_preview.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CoverImagePreview extends StatelessWidget {
  final XFile? pickedFile;
  final String? imageUrl;
  final VoidCallback onRemove;

  const CoverImagePreview({
    super.key,
    this.pickedFile,
    this.imageUrl,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const maxWidth = 600.0; // Constrain for large screens
        final availableWidth = constraints.maxWidth - Sizes.p8 * 2;
        final imageWidth = availableWidth.clamp(0.0, maxWidth);
        final imageHeight = imageWidth * 3 / 4; // 4:3 ratio
        return Center(
          child: ImagePreview(
            image: CustomImageWrapper(
              aspectRatio: 4 / 3,
              imageXFile: pickedFile,
              imageUrl: imageUrl,
            ),
            onRemove: onRemove,
            height: imageHeight,
            width: imageWidth,
          ),
        );
      },
    );
  }
}
