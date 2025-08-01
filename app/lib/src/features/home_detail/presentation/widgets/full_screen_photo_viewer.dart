import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/is_small_screen.dart.dart';
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
  dispose() {
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
    final isLarge = !isSmallScreen(context);

    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          PhotoViewGallery.builder(
            pageController: _pageController,
            itemCount: widget.images.length,
            builder: (context, index) => PhotoViewGalleryPageOptions(
              imageProvider: AssetImage(widget.images[index]),
              heroAttributes: PhotoViewHeroAttributes(
                tag: '${widget.images[index]}-$index',
              ),
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered * 2,
            ),
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            scrollPhysics: const BouncingScrollPhysics(),
            backgroundDecoration: BoxDecoration(color: Colors.transparent),
          ),

          // Close button
          Positioned(
            top: 40,
            right: 20,
            child: CarouselButton(
              icon: Icons.close,
              onPressed: () => Navigator.of(context).pop(),
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
