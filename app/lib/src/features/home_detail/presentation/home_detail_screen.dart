import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/common_widgets/empty_placeholder_widget.dart';
import 'package:app/src/core/common_widgets/responsive_two_column_layout.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/is_small_screen.dart.dart';
import 'package:app/src/features/home/presentation/widgets/persistent_error_bar.dart';
import 'package:app/src/features/home_detail/application/entity_detail_service.dart';
import 'package:app/src/features/home_detail/presentation/home_detail_app_bar.dart';
import 'package:app/src/features/home_detail/presentation/home_detail_bottom_section.dart';
import 'package:app/src/features/home_detail/presentation/home_detail_top_right_section.dart';
import 'package:app/src/features/home_detail/presentation/skeletons/home_detail_skeleton.dart';
import 'package:app/src/features/home_detail/presentation/home_detail_top_left_section.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeDetailScreen extends ConsumerWidget {
  final CategoryId categoryId;
  final EntityId? entityId;
  final bool isPushed;

  const HomeDetailScreen({
    super.key,
    required this.categoryId,
    required this.entityId,
    this.isPushed = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (entityId == null) {
      return EmptyPlaceholderWidget(message: context.loc.somethingWentWrong);
    }

    final combinedValue = ref.watch(
      fetchEntityWithReviewsProvider((categoryId, entityId!)),
    );

    final isSmall = isSmallScreen(context);

    return Scaffold(
      appBar: HomeDetailAppBar(
        entityId: entityId!,
        categoryId: categoryId,
        isPushed: isPushed,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
              child: AsyncValueWidget(
                value: combinedValue,
                loading: const HomeDetailSkeleton(),
                error: (e, st) => EmptyPlaceholderWidget(
                  message: context.loc.somethingWentWrong,
                ),
                data: (tuple) {
                  final entity = tuple.$1;
                  final reviews = tuple.$2;
                  final reviewsLoadFailed = tuple.$3;

                  if (entity == null) {
                    return const HomeDetailSkeleton();
                  }

                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
                    child: Column(
                      spacing: Sizes.p8,
                      children: [
                        ResponsiveTwoColumnLayout(
                          startContent: entity.galleryImageUrls.isEmpty
                              ? const SizedBox.shrink()
                              : HomeDetailTopLeftSection(
                                  images: entity.galleryImageUrls,
                                ),
                          endContent: HomeDetailTopRightSection(entity: entity),
                          spacing: isSmall ? Sizes.p8 : Sizes.p16,
                        ),
                        HomeDetailBottomSection(
                          entity: entity,
                          reviews: reviews,
                          reviewsLoadFailed: reviewsLoadFailed,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Sticky error bar at the bottom
            if (combinedValue.hasValue && combinedValue.value!.$3)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: PersistentErrorBar(
                  message: context.loc.reviewsLoadFailedMessage,
                  onRetry: () {
                    ref.invalidate(
                      fetchEntityWithReviewsProvider((categoryId, entityId!)),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
