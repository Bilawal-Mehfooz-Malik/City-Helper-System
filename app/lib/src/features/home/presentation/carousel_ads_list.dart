import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/common_widgets/custom_image.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/data/real/ads_carousel_repository.dart';
import 'package:app/src/features/home/domain/carousel_ad.dart';
import 'package:app/src/features/home/presentation/home_skeletons.dart';
import 'package:app/src/features/home/presentation/controllers/home_error_notification_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// uses [16/9] AspectRatio
class CarouselAdsList extends ConsumerWidget {
  final CategoryId categoryId;
  const CarouselAdsList({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the async provider for the given categoryId
    final adsValue = ref.watch(adsListFutureProvider(categoryId));

    return AsyncValueWidget<List<CarouselAd>>(
      value: adsValue,
      loading: const CarouselAdListSkeleton(),
      error: (error, stack) {
        // In the next frame, report the error to the central controller.
        // This prevents a "setState() or markNeedsBuild() called during build" error.
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref
              .read(homeErrorNotificationControllerProvider.notifier)
              .addError(error);
        });
        // Return an empty widget to hide this section.
        return const SizedBox.shrink();
      },
      data: (ads) {
        // Return an empty widget if there are no ads
        if (ads.isEmpty) {
          return const SizedBox.shrink();
        }

        // Show the list of ads
        return Column(
          children: [
            CarouselSlider.builder(
              itemCount: ads.length,
              options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1,
                aspectRatio: 16 / 9,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
              itemBuilder: (_, index, __) {
                final ad = ads[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: Sizes.p16),
                  child: CustomImageWrapper(
                    aspectRatio: 16 / 9,
                    imageUrl: ad.imageUrl,
                  ),
                );
              },
            ),
            gapH16,
          ],
        );
      },
    );
  }
}
