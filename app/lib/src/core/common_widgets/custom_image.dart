import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Custom image widget that loads an image as a static asset.
class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    // TODO: Use [CachedNetworkImage] if the url points to a remote resource
    return Image.asset(imageUrl);
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
