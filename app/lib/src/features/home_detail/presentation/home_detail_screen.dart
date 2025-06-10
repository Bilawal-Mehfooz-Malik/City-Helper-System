import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/common_widgets/empty_placeholder_widget.dart';
import 'package:app/src/core/common_widgets/responsive_two_column_layout.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home_detail/application/entity_detail_service.dart';
import 'package:app/src/features/home_detail/presentation/home_detail_app_bar.dart';
import 'package:app/src/features/home_detail/presentation/home_detail_bottom_section.dart';
import 'package:app/src/features/home_detail/presentation/home_detail_top_right_section.dart';
import 'package:app/src/features/home_detail/presentation/home_detail_skeleton.dart';
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
  Widget build(BuildContext context, WidgetRef ref) {
    if (entityId == null) {
      return EmptyPlaceholderWidget(message: context.loc.somethingWentWrong);
    }

    final entityDetailsValue = ref.watch(
      fetchEntityDetailsProvider(categoryId, entityId!),
    );

    final isSmall = _isSmallScreen(context);

    return Scaffold(
      appBar: HomeDetailAppBar(
        entityId: entityId!,
        categoryId: categoryId,
        isPushed: isPushed,
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.p16),
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
                child: Column(
                  spacing: Sizes.p8,
                  children: [
                    gapH4,
                    ResponsiveTwoColumnLayout(
                      startContent: entity.imageUrls.isEmpty
                          ? SizedBox.shrink()
                          : HomeDetailTopLeftSection(images: entity.imageUrls),
                      endContent: HomeDetailTopRightSection(entity: entity),
                      spacing: isSmall ? Sizes.p8 : Sizes.p16,
                    ),
                    HomeDetailBottomSection(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
