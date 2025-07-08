import 'dart:io';

import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/exceptions/app_logger.dart';
import 'package:app/src/core/utils/in_memory_storage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // <-- Add this

class CustomImage extends ConsumerWidget {
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
    this.iconPersonSize = 60,
  });

  final String? imageUrl;
  final XFile? imageXFile;

  final BorderRadius borderRadius;
  final bool allBorders;
  final bool borderTopLeft;
  final bool borderTopRight;
  final bool borderBottomLeft;
  final bool borderBottomRight;
  final double iconPersonSize;

  final bool useAspectRatio;
  final double aspectRatio;
  final BoxFit fit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageWidget = _buildImage(ref, iconPersonSize);

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

  Widget _buildImage(WidgetRef ref, double iconPersonSize) {
    if (imageXFile != null) {
      return kIsWeb
          ? Image.network(imageXFile!.path, fit: fit)
          : Image.file(File(imageXFile!.path), fit: fit);
    }

    if (imageUrl == null || imageUrl!.isEmpty) {
      return CircleAvatar(child: Icon(Icons.person, size: iconPersonSize));
    }

    // ✅ in-memory image handling via provider
    if (imageUrl!.startsWith('inmemory://')) {
      final userId = imageUrl!.replaceFirst('inmemory://', '');
      final inMemoryStorage = ref.watch(inMemoryImageStorageProvider);
      final bytes = inMemoryStorage.getImageBytes(userId);

      if (bytes != null) {
        return Image.memory(bytes, fit: fit);
      } else {
        return CircleAvatar(
          child: Icon(Icons.image_not_supported, size: iconPersonSize),
        );
      }
    }

    // ✅ network image
    if (imageUrl!.startsWith('http')) {
      return CachedNetworkImage(
        imageUrl: localhostFriendlyImageUrl(imageUrl!),
        fit: fit,
        errorWidget: (context, url, error) {
          AppLogger.logError(
            'Failed to load image from URL: $url',
            error: error,
          );
          return CircleAvatar(child: Icon(Icons.error, size: iconPersonSize));
        },
        placeholder: (_, __) =>
            const Center(child: CircularProgressIndicator()),
      );
    }

    // ✅ fallback asset
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
