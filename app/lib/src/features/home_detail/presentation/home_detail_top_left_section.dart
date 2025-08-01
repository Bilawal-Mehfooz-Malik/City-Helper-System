import 'package:app/src/core/common_widgets/custom_image.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/is_small_screen.dart.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home_detail/presentation/widgets/carousel_button.dart';
import 'package:app/src/features/home_detail/presentation/widgets/full_screen_photo_viewer.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeDetailTopLeftSection extends StatefulWidget {
  final List<String> images;
  const HomeDetailTopLeftSection({super.key, required this.images});

  @override
  State<HomeDetailTopLeftSection> createState() =>
      _HomeDetailTopLeftSectionState();
}

class _HomeDetailTopLeftSectionState extends State<HomeDetailTopLeftSection> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  void _openImageViewer(BuildContext context, int initialIndex) {
    final isSmall = isSmallScreen(context);

    if (isSmall) {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => FullscreenPhotoViewer(
            images: widget.images,
            initialIndex: initialIndex,
          ),
        ),
      );
    } else {
      showDialog<void>(
        context: context,
        builder: (_) => Dialog(
          backgroundColor: context.colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.p24),
          ),
          insetPadding: const EdgeInsets.all(Sizes.p16),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: FullscreenPhotoViewer(
              images: widget.images,
              initialIndex: initialIndex,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isSmall = isSmallScreen(context);

    return SingleChildScrollView(
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
                  return InkWell(
                    onTap: () => _openImageViewer(context, index),
                    child: CustomImageWrapper(
                      aspectRatio: 16 / 9,
                      imageUrl: widget.images[index],
                    ),
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
          // Thumbnail Navigation
          if (!isSmall) ...[
            gapH12,
            ThumnailImagesList(
              current: _current,
              imageUrls: widget.images,
              onTap: (index) => _controller.animateToPage(index),
            ),
          ],
        ],
      ),
    );
  }
}

class ThumnailImagesList extends StatelessWidget {
  const ThumnailImagesList({
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
          return InkWell(
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
              child: CustomImageWrapper(
                aspectRatio: 16 / 9,
                borderRadius: BorderRadius.circular(6),
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
