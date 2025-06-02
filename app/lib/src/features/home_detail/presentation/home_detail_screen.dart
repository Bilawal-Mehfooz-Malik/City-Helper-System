import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/common_widgets/empty_placeholder_widget.dart';
import 'package:app/src/core/common_widgets/responsive_two_column_layout.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home_detail/application/entity_detail_service.dart';
import 'package:app/src/features/home_detail/presentation/home_detail_app_bar.dart';
import 'package:app/src/features/home_detail/presentation/entity_detail_content.dart';
import 'package:app/src/features/home_detail/presentation/home_detail_skeleton.dart';
import 'package:app/src/features/home_detail/presentation/home_detail_carousel_slider.dart';
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

    final entityDetailsValue = ref.watch(
      fetchEntityDetailsProvider(categoryId, entityId!),
    );

    return Scaffold(
      appBar: HomeDetailAppBar(
        entityId: entityId!,
        categoryId: categoryId,
        isPushed: isPushed,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
          child: AsyncValueWidget(
            value: entityDetailsValue,
            loading: HomeDetailSkeleton(),
            data: (entity) {
              if (entity == null) {
                return EmptyPlaceholderWidget(
                  message: context.loc.somethingWentWrong,
                );
              }

              return SingleChildScrollView(
                child: ResponsiveTwoColumnLayout(
                  startContent: entity.imageUrls.isEmpty
                      ? SizedBox.shrink()
                      : HomeDetailCarouselSlider(images: entity.imageUrls),
                  endContent: EntityDetailContent(entity: entity),
                  spacing: Sizes.p16,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
