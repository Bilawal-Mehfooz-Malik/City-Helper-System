import 'dart:io';

import 'package:app/src/core/exceptions/app_logger.dart';
import 'package:app/src/core/utils/in_memory_storage.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// A container that wraps a CustomImage to apply decorative transformations
/// like a specific border radius and aspect ratio.
class CustomImageWrapper extends StatelessWidget {
  const CustomImageWrapper({
    super.key,
    // CustomImage properties
    this.imageUrl,
    this.imageXFile,
    this.fit = BoxFit.cover,
    this.placeholderIconSize = 48,
    this.useCircleLoading = false,
    this.placeholder,
    // Container-specific properties
    this.borderRadius,
    this.aspectRatio,
    this.width,
    this.height,
  });

  // --- Properties for the inner CustomImage ---
  final String? imageUrl;
  final XFile? imageXFile;
  final BoxFit fit;
  final double placeholderIconSize;
  final bool useCircleLoading;
  final Widget? placeholder;

  // --- Properties for the container itself ---
  /// The geometry of the border radius. Use standard Flutter classes like
  /// `BorderRadius.circular()`, `BorderRadius.only()`, or `BorderRadius.vertical()`.
  /// If null, no clipping will be applied.
  final BorderRadiusGeometry? borderRadius;

  /// The aspect ratio to enforce on the child. If null, the widget will
  /// size itself based on the child or width/height constraints.
  final double? aspectRatio;

  /// An optional fixed width for the container.
  final double? width;

  /// An optional fixed height for the container.
  final double? height;

  @override
  Widget build(BuildContext context) {
    // The core image logic is delegated entirely to CustomImage.
    Widget imageWidget = CustomImage(
      fit: fit,
      imageUrl: imageUrl,
      imageXFile: imageXFile,
      placeholderIconSize: placeholderIconSize,
      useCircleLoading: useCircleLoading,
      placeholder: placeholder,
    );

    // 1. Conditionally apply border radius if it's provided.
    if (borderRadius != null) {
      imageWidget = ClipRRect(borderRadius: borderRadius!, child: imageWidget);
    }

    // 2. Conditionally apply aspect ratio if it's provided.
    if (aspectRatio != null) {
      imageWidget = AspectRatio(aspectRatio: aspectRatio!, child: imageWidget);
    }

    // 3. Wrap in a SizedBox if width or height are provided.
    if (width != null || height != null) {
      imageWidget = SizedBox(width: width, height: height, child: imageWidget);
    }

    return imageWidget;
  }
}

/// A versatile image widget that can display images from the network,
/// local files (XFile), in-memory cache, or project assets.
///
/// It handles loading states, errors, and platform-specific quirks for localhost URLs.
/// It also includes an automatic retry mechanism for failed network images.
class CustomImage extends ConsumerStatefulWidget {
  const CustomImage({
    super.key,
    this.imageUrl,
    this.imageXFile,
    this.fit = BoxFit.cover,
    this.placeholderIconSize = 48,
    this.useCircleLoading = false,
    this.placeholder,
  });

  final String? imageUrl;
  final XFile? imageXFile;
  final BoxFit fit;
  final double placeholderIconSize;
  final bool useCircleLoading;

  /// An optional custom widget to display when imageUrl is null or empty.
  /// If not provided, it defaults to a generic ImageErrorPlaceholder.
  final Widget? placeholder;

  @override
  ConsumerState<CustomImage> createState() => _CustomImageState();
}

class _CustomImageState extends ConsumerState<CustomImage> {
  int _retryCount = 0;
  String? _effectiveImageUrl;

  // --- Retry Logic Configuration ---
  static const int _maxRetries = 3;
  static const Duration _retryDelay = Duration(seconds: 2);

  @override
  void initState() {
    super.initState();
    _effectiveImageUrl = widget.imageUrl;
  }

  @override
  void didUpdateWidget(CustomImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If the imageUrl from the parent widget changes, reset the state.
    if (widget.imageUrl != oldWidget.imageUrl) {
      setState(() {
        _retryCount = 0;
        _effectiveImageUrl = widget.imageUrl;
      });
    }
  }

  void _retry() {
    if (_retryCount < _maxRetries) {
      Future.delayed(_retryDelay, () {
        if (mounted) {
          setState(() {
            _retryCount++;
            // Append a dummy query param to force a reload. Handles existing query params.
            final uri = Uri.parse(widget.imageUrl!);
            final newParams = Map<String, dynamic>.from(uri.queryParameters);
            newParams['retry'] = _retryCount.toString();
            _effectiveImageUrl = uri
                .replace(queryParameters: newParams)
                .toString();
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final errorPlaceholder = ImageErrorPlaceholder(
      iconSize: widget.placeholderIconSize,
    );

    // Priority 1: Local file (from image picker).
    if (widget.imageXFile != null) {
      final imageProvider = kIsWeb
          ? NetworkImage(widget.imageXFile!.path) as ImageProvider
          : FileImage(File(widget.imageXFile!.path));

      return Image(
        image: imageProvider,
        fit: widget.fit,
        errorBuilder: (context, error, stack) => errorPlaceholder,
      );
    }

    // Priority 2: No valid source provided.
    if (_effectiveImageUrl == null || _effectiveImageUrl!.isEmpty) {
      // Use the injected placeholder, or default to the generic error one.
      return widget.placeholder ?? errorPlaceholder;
    }

    // Priority 3: In-memory image.
    if (_effectiveImageUrl!.startsWith('inmemory://')) {
      return _buildInMemoryImage(errorPlaceholder);
    }

    // Priority 4: Network image.
    if (_effectiveImageUrl!.startsWith('http')) {
      return _buildNetworkImage(errorPlaceholder);
    }

    // Priority 5: Local asset image.
    return Image.asset(
      _effectiveImageUrl!,
      fit: widget.fit,
      errorBuilder: (context, error, stackTrace) {
        AppLogger.logError(
          'Failed to load asset: $_effectiveImageUrl',
          error: error,
          stackTrace: stackTrace,
        );
        return errorPlaceholder;
      },
    );
  }

  Widget _buildInMemoryImage(Widget errorPlaceholder) {
    final userId = _effectiveImageUrl!.replaceFirst('inmemory://', '');
    final bytes = ref.read(inMemoryImageStorageProvider).getImageBytes(userId);
    if (bytes == null) {}
    return bytes != null
        ? Image.memory(bytes, fit: widget.fit)
        : errorPlaceholder;
  }

  Widget _buildNetworkImage(Widget errorPlaceholder) {
    return CachedNetworkImage(
      imageUrl: _localhostFriendlyImageUrl(_effectiveImageUrl!),
      fit: widget.fit,
      errorWidget: (context, url, error) {
        AppLogger.logError('Failed to load image from URL: $url', error: error);
        // Trigger a retry if we haven't exceeded the max count.
        if (_retryCount < _maxRetries) {
          _retry();
        }
        return errorPlaceholder;
      },
      placeholder: (_, _) => Skeletonizer(
        enabled: true,
        child: widget.useCircleLoading
            ? const Bone.circle()
            : const Bone.square(),
      ),
    );
  }

  String _localhostFriendlyImageUrl(String url) {
    const localhostDefault1 = 'http://127.0.0.1';
    const localhostDefault2 = 'http://localhost';
    const localhostAndroid = 'http://10.0.2.2';
    final isAndroid = !kIsWeb && Platform.isAndroid;

    if (isAndroid) {
      if (url.startsWith(localhostDefault1)) {
        return url.replaceFirst(localhostDefault1, localhostAndroid);
      } else if (url.startsWith(localhostDefault2)) {
        return url.replaceFirst(localhostDefault2, localhostAndroid);
      }
    }
    if (!isAndroid && url.startsWith(localhostAndroid)) {
      return url.replaceFirst(localhostAndroid, localhostDefault1);
    }
    return url;
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

/// A standardized placeholder for displaying when an image fails to load.
class ImageErrorPlaceholder extends StatelessWidget {
  const ImageErrorPlaceholder({
    super.key,
    this.iconSize = 48,
    this.icon = Icons.broken_image_outlined,
  });

  /// The size of the placeholder icon.
  final double iconSize;

  /// The icon to display within the placeholder.
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colorScheme.surfaceContainerHighest,
      child: Center(
        child: Icon(
          icon,
          size: iconSize,
          color: context.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
