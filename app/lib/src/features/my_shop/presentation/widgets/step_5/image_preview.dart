import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/my_shop/presentation/widgets/step_5/remove_button.dart';
import 'package:flutter/material.dart';

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
                color: context.colorScheme.onSurface.withAlpha(51),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
            border: Border.all(
              color: context.colorScheme.outline.withAlpha(128),
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
