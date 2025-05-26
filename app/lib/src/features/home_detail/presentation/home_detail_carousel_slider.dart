import 'package:app/src/core/common_widgets/custom_image.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeDetailCarouselSlider extends StatefulWidget {
  final List<String> images;
  const HomeDetailCarouselSlider({super.key, required this.images});

  @override
  State<HomeDetailCarouselSlider> createState() =>
      _HomeDetailCarouselSliderState();
}

class _HomeDetailCarouselSliderState extends State<HomeDetailCarouselSlider> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  bool _isSmallScreen(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final screenType = ScreenType.determine(
      width: size.width,
      height: size.height,
    );
    return screenType == ScreenType.smallHeight ||
        screenType == ScreenType.mobile;
  }

  @override
  Widget build(BuildContext context) {
    final isSmall = _isSmallScreen(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Main Carousel Section
            Stack(
              alignment: Alignment.center,
              children: [
                // Carousel Slider
                CarouselSlider.builder(
                  itemCount: widget.images.length,
                  carouselController: _controller,
                  itemBuilder: (context, index, _) {
                    return CustomImage(
                      aspectRatio: 16 / 9,
                      imageUrl: widget.images[index],
                    );
                  },
                  options: CarouselOptions(
                    viewportFraction: 1,
                    onPageChanged: (index, _) {
                      setState(() => _current = index);
                    },
                  ),
                ),
                // Left Navigation Arrow
                Positioned(
                  left: Sizes.p8,
                  child: CarouselButton(
                    icon: Icons.arrow_back_ios_new,
                    onPressed: () => _controller.previousPage(),
                  ),
                ),
                // Right Navigation Arrow
                Positioned(
                  right: Sizes.p8,
                  child: CarouselButton(
                    icon: Icons.arrow_forward_ios,
                    onPressed: () => _controller.nextPage(),
                  ),
                ),
                // Pagination Dots
                Positioned(
                  bottom: Sizes.p12,
                  child: CarouselPaginationDots(
                    current: _current,
                    length: widget.images.length,
                  ),
                ),
              ],
            ),
            gapH12,
            // Thumbnail Navigation
            if (!isSmall)
              ThumnailImagesWidget(
                current: _current,
                imageUrls: widget.images,
                onTap: (index) => _controller.animateToPage(index),
              ),
          ],
        ),
      ),
    );
  }
}

class ThumnailImagesWidget extends StatelessWidget {
  const ThumnailImagesWidget({
    super.key,
    required this.imageUrls,
    required this.onTap,
    required this.current,
  });

  final int current;
  final List<String> imageUrls;
  final void Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              width: 100,
              height: 80,
              margin: const EdgeInsets.only(right: Sizes.p8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Sizes.p8),
                border: Border.all(
                  width: 2.0,
                  color: current == index
                      ? context.colorScheme.primary
                      : Colors.transparent,
                ),
              ),
              child: CustomImage(
                borderRadius: BorderRadius.circular(6),
                useAspectRatio: false,
                imageUrl: imageUrls[index],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CarouselPaginationDots extends StatelessWidget {
  const CarouselPaginationDots({
    super.key,
    required this.length,
    required this.current,
  });

  final int length;
  final int current;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (index) {
        return Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: Sizes.p4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: current == index
                ? context.colorScheme.primary
                : context.colorScheme.surface,
          ),
        );
      }),
    );
  }
}

class CarouselButton extends StatelessWidget {
  const CarouselButton({super.key, required this.icon, this.onPressed});

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, color: context.colorScheme.onSurface),
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: context.colorScheme.surface.withAlpha(140),
      ),
    );
  }
}
