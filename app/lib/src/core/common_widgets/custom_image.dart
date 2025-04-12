import 'package:app/src/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Custom image widget that loads an image as a static asset.
class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.imageUrl,
    this.borderRadius = const BorderRadius.all(Radius.circular(Sizes.p12)),
    this.allBorders = true,
    this.borderTopLeft = true,
    this.borderTopRight = true,
    this.borderBottomLeft = true,
    this.borderBottomRight = true,
    this.aspectRatio = 4 / 3,
    this.useAspectRatio = true,
  });

  final String imageUrl;
  final BorderRadius borderRadius;
  final bool allBorders;
  final bool borderTopLeft;
  final bool borderTopRight;
  final bool borderBottomLeft;
  final bool borderBottomRight;
  final bool useAspectRatio;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    if (useAspectRatio) {
      return AspectRatio(aspectRatio: aspectRatio, child: _buildImageWidget());
    } else {
      return _buildImageWidget();
    }
  }

  ClipRRect _buildImageWidget() {
    final decoration = BorderRadius.only(
      topLeft: allBorders || borderTopLeft ? borderRadius.topLeft : Radius.zero,
      topRight:
          allBorders || borderTopRight ? borderRadius.topRight : Radius.zero,
      bottomLeft:
          allBorders || borderBottomLeft
              ? borderRadius.bottomLeft
              : Radius.zero,
      bottomRight:
          allBorders || borderBottomRight
              ? borderRadius.bottomRight
              : Radius.zero,
    );
    return ClipRRect(
      borderRadius: decoration,
      child: Image.asset(imageUrl, fit: BoxFit.cover),
    );
  }
}

/// Custom image widget that loads an image as a static asset.
class CustomSvgImage extends StatelessWidget {
  final String imageUrl;
  const CustomSvgImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(imageUrl);
  }
}
