import 'package:app/src/core/common_widgets/responsive_center.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/features/home_detail/presentation/widgets/description_widget.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeDetailBottomSection extends ConsumerWidget {
  final EntityDetail entity;
  const HomeDetailBottomSection({super.key, required this.entity});

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
    final isSmall = _isSmallScreen(context);

    return ResponsiveCenter(
      showCard: isSmall ? false : true,
      paddingInsideCard: isSmall
          ? EdgeInsets.zero
          : EdgeInsets.symmetric(vertical: Sizes.p8, horizontal: Sizes.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Description Title
          Text(
            context.loc.description,
            style: context.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          gapH4,
          DescriptionWidget(text: entity.description),
        ],
      ),
    );
  }
}
