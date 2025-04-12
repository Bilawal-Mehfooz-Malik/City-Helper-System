import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/common_widgets/custom_image.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/data/real/ads_carousel_repository.dart';
import 'package:app/src/features/home/domain/carousel_ad.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// uses [16/9] AspectRatio
class CarouselAdsList extends ConsumerWidget {
  final CategoryId categoryId;
  const CarouselAdsList({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adsValue = ref.watch(adsListFutureProvider(categoryId));

    return AsyncValueWidget(
      value: adsValue,
      data: (ads) {
        if (ads.isEmpty) {
          return SizedBox.shrink();
        }

        return Column(
          children: [
            CarouselSlider.builder(
              itemCount: ads.length,
              options: _buildOptions(),
              itemBuilder:
                  (_, index, __) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: Sizes.p12),
                    child: CarouselImage(ad: ads[index]),
                  ),
            ),
            gapH8,
          ],
        );
      },
    );
  }

  CarouselOptions _buildOptions() {
    return CarouselOptions(
      autoPlay: true,
      viewportFraction: 1,
      aspectRatio: 16 / 9,
      autoPlayInterval: const Duration(seconds: 5),
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
    );
  }
}

class CarouselImage extends StatelessWidget {
  final CarouselAd ad;
  const CarouselImage({super.key, required this.ad});

  @override
  Widget build(BuildContext context) {
    return CustomImage(aspectRatio: 16 / 9, imageUrl: ad.imageUrl);
  }
}
