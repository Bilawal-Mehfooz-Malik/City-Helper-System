import 'dart:io';

import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/exceptions/app_logger.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    this.imageUrl,
    this.imageXFile,
    this.borderRadius = const BorderRadius.all(Radius.circular(Sizes.p12)),
    this.allBorders = true,
    this.borderTopLeft = true,
    this.borderTopRight = true,
    this.borderBottomLeft = true,
    this.borderBottomRight = true,
    this.aspectRatio = 4 / 3,
    this.useAspectRatio = true,
    this.fit = BoxFit.cover,
  });

  final String? imageUrl;
  final XFile? imageXFile;

  final BorderRadius borderRadius;
  final bool allBorders;
  final bool borderTopLeft;
  final bool borderTopRight;
  final bool borderBottomLeft;
  final bool borderBottomRight;

  final bool useAspectRatio;
  final double aspectRatio;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final imageWidget = _buildImage();

    final clippedImage = ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: allBorders || borderTopLeft
            ? borderRadius.topLeft
            : Radius.zero,
        topRight: allBorders || borderTopRight
            ? borderRadius.topRight
            : Radius.zero,
        bottomLeft: allBorders || borderBottomLeft
            ? borderRadius.bottomLeft
            : Radius.zero,
        bottomRight: allBorders || borderBottomRight
            ? borderRadius.bottomRight
            : Radius.zero,
      ),
      child: imageWidget,
    );

    return useAspectRatio
        ? AspectRatio(aspectRatio: aspectRatio, child: clippedImage)
        : clippedImage;
  }

  Widget _buildImage() {
    if (imageXFile != null) {
      return kIsWeb
          ? Image.network(imageXFile!.path, fit: fit)
          : Image.file(File(imageXFile!.path), fit: fit);
    }

    if (imageUrl == null || imageUrl!.isEmpty) {
      return CircleAvatar(child: const Icon(Icons.person, size: 60));
    }

    // Use CachedNetworkImage only for http(s)
    if (imageUrl!.startsWith('http')) {
      return CachedNetworkImage(
        imageUrl: localhostFriendlyImageUrl(imageUrl!),
        fit: fit,
        errorWidget: (context, url, error) {
          AppLogger.logError(
            'Failed to load image from URL: $url',
            error: error,
          );
          return CircleAvatar(child: const Icon(Icons.error, size: 60));
        },
        placeholder: (_, __) =>
            const Center(child: CircularProgressIndicator()),
      );
    }

    // Fallback to asset if not a network image
    return Image.asset(imageUrl!, fit: fit);
  }

  String localhostFriendlyImageUrl(String imageUrl) {
    const localhostDefault1 = 'http://127.0.0.1';
    const localhostDefault2 = 'http://localhost';
    const localhostAndroid = 'http://10.0.2.2';
    final isAndroid = !kIsWeb && Platform.isAndroid;
    if (isAndroid) {
      if (imageUrl.startsWith(localhostDefault1)) {
        return imageUrl.replaceFirst(localhostDefault1, localhostAndroid);
      } else if (imageUrl.startsWith(localhostDefault2)) {
        return imageUrl.replaceFirst(localhostDefault2, localhostAndroid);
      }
    }
    if (!isAndroid && imageUrl.startsWith(localhostAndroid)) {
      return imageUrl.replaceFirst(localhostAndroid, localhostDefault1);
    }
    return imageUrl;
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
