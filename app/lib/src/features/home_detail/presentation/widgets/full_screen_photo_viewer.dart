import 'package:app/src/core/common_widgets/custom_image.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/is_small_screen.dart.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home_detail/presentation/widgets/carousel_button.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class FullscreenPhotoViewer extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const FullscreenPhotoViewer({
    super.key,
    required this.images,
    required this.initialIndex,
  });

  @override
  State<FullscreenPhotoViewer> createState() => _FullscreenPhotoViewerState();
}

class _FullscreenPhotoViewerState extends State<FullscreenPhotoViewer> {
  late int _currentIndex;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPrevious() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToNext() {
    if (_currentIndex < widget.images.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isSmall = isSmallScreen(context);
    final isLarge = !isSmall;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: isSmall
          ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  icon: Icon(Icons.close, color: context.colorScheme.onSurface),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            )
          : null,
      body: Stack(
        alignment: Alignment.center,
        children: [
          PhotoViewGallery.builder(
            pageController: _pageController,
            itemCount: widget.images.length,
            builder: (context, index) {
              final imageUrl = widget.images[index];
              return PhotoViewGalleryPageOptions.customChild(
                heroAttributes: PhotoViewHeroAttributes(
                  tag: '$imageUrl-$index',
                ),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 2,
                child: CustomImage(imageUrl: imageUrl, fit: BoxFit.contain),
              );
            },
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            scrollPhysics: const BouncingScrollPhysics(),
            backgroundDecoration: const BoxDecoration(
              color: Colors.transparent,
            ),
          ),
          // Close button for large screens
          if (isLarge)
            Positioned(
              top: Sizes.p16,
              right: Sizes.p16,
              child: Container(
                decoration: BoxDecoration(
                  color: context.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(Sizes.p24),
                ),
                child: IconButton(
                  icon: Icon(Icons.close, color: context.colorScheme.onSurface),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
          // Conditionally visible left button
          if (isLarge && _currentIndex > 0)
            Positioned(
              left: Sizes.p16,
              child: CarouselButton(
                icon: Icons.arrow_back_ios_new,
                onPressed: _goToPrevious,
              ),
            ),

          // Conditionally visible right button
          if (isLarge && _currentIndex < widget.images.length - 1)
            Positioned(
              right: Sizes.p16,
              child: CarouselButton(
                icon: Icons.arrow_forward_ios,
                onPressed: _goToNext,
              ),
            ),
        ],
      ),
    );
  }
}
