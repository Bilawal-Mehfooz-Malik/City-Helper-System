import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/common_widgets/custom_image.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/async_value_ui.dart';
import 'package:app/src/features/home/data/real/ads_carousel_repository.dart';
import 'package:app/src/features/home/domain/carousel_ad.dart';
import 'package:app/src/features/home/presentation/controllers/ad_interaction_controller.dart';
import 'package:app/src/features/home/presentation/controllers/subcategory_controller.dart';
import 'package:app/src/features/home/presentation/home_skeletons.dart';
import 'package:app/src/routers/app_router.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

/// uses [16/9] AspectRatio
class CarouselAdsList extends ConsumerStatefulWidget {
  final CategoryId categoryId;
  const CarouselAdsList({super.key, required this.categoryId});

  @override
  ConsumerState<CarouselAdsList> createState() => _CarouselAdsListState();
}

class _CarouselAdsListState extends ConsumerState<CarouselAdsList> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Record the impression for the first ad when the data is available.
    // This ensures the first ad is counted before any user interaction.
    final subcategoryId = ref.read(subcategoryControllerProvider);
    final adsValue = ref.read(
      finalCarouselAdsProvider(widget.categoryId, subcategoryId: subcategoryId),
    );
    if (adsValue.hasValue) {
      final ads = adsValue.asData!.value;
      if (ads.isNotEmpty) {
        // Use a post-frame callback to avoid calling setState during build.
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            ref
                .read(adInteractionNotifierProvider.notifier)
                .recordAdImpression(ads.first.id);
          }
        });
      }
    }
  }

  // The UI is responsible for navigation and showing errors.
  // The controller is responsible for the business logic.
  Future<void> _onAdTapped(
    BuildContext context,
    WidgetRef ref,
    CarouselAd ad,
  ) async {
    // First, execute the business logic.
    await ref.read(adInteractionNotifierProvider.notifier).recordAdClick(ad.id);
    // Then, handle navigation if the widget is still mounted.
    if (!context.mounted) return;

    switch (ad.linkType) {
      case AdLinkType.internalProfile:
        if (ad.internalProfileId != null) {
          context.pushNamed(
            AppRoute.homeDetail.name,
            pathParameters: {
              'categoryId': ad.categoryId.toString(),
              'entityId': ad.internalProfileId!,
            },
          );
        }
        break;
      case AdLinkType.externalUrl:
        if (ad.externalUrl != null) {
          final uri = Uri.parse(ad.externalUrl!);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Listen to the controller state to show a snackbar on error.
    ref.listen<AsyncValue<void>>(adInteractionNotifierProvider, (_, state) {
      state.showAlertDialogOnError(context);
    });

    final subcategoryId = ref.watch(subcategoryControllerProvider);
    final adsValue = ref.watch(
      finalCarouselAdsProvider(widget.categoryId, subcategoryId: subcategoryId),
    );

    return AsyncValueWidget<List<CarouselAd>>(
      value: adsValue,
      loading: const CarouselAdListSkeleton(),
      error: (_, _) => const SizedBox.shrink(),
      data: (ads) {
        if (ads.isEmpty) {
          return const SizedBox.shrink();
        }

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
                onPageChanged: (index, reason) {
                  final ad = ads[index];
                  ref
                      .read(adInteractionNotifierProvider.notifier)
                      .recordAdImpression(ad.id);
                },
              ),
              itemBuilder: (_, index, _) {
                final ad = ads[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
                  child: InkWell(
                    onTap: () => _onAdTapped(context, ref, ad),
                    child: CustomImageWrapper(
                      borderRadius: BorderRadius.circular(Sizes.p16),
                      aspectRatio: 16 / 9,
                      imageUrl: ad.imageUrl,
                    ),
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
