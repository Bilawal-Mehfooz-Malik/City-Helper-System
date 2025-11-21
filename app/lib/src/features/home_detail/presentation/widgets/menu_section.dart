import 'package:app/src/core/common_widgets/responsive_center_beta.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/common_widgets/custom_image.dart';
import 'package:app/src/core/utils/screen_utils.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home_detail/presentation/widgets/full_screen_photo_viewer.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app/src/routers/app_router.dart';

class MenuSection extends StatefulWidget {
  final List<String> menuImageUrls;

  const MenuSection({super.key, required this.menuImageUrls});

  @override
  State<MenuSection> createState() => _MenuSectionState();
}

class _MenuSectionState extends State<MenuSection> {
  void _openImageViewer(BuildContext context, int initialIndex) {
    final isSmall = isMobileScreen(context);

    if (isSmall) {
      context.pushNamed(
        AppRoute.photoViewer.name,
        extra: {'images': widget.menuImageUrls, 'initialIndex': initialIndex},
      );
    } else {
      showDialog<void>(
        context: context,
        builder: (_) => Dialog(
          backgroundColor: context.colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.p16),
          ),
          insetPadding: const EdgeInsets.all(Sizes.p16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.p16),
            child: FullscreenPhotoViewer(
              images: widget.menuImageUrls,
              initialIndex: initialIndex,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isSmall = isMobileScreen(context);
    return ResponsiveCenter(
      showCard: !isSmall,
      paddingInsideCard: isSmall
          ? EdgeInsets.zero
          : const EdgeInsets.symmetric(
              vertical: Sizes.p8,
              horizontal: Sizes.p16,
            ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.loc.menu,
            style: context.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          gapH4,
          SizedBox(
            height: 240, // Increased height
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: widget.menuImageUrls.length,
              separatorBuilder: (context, index) => gapW8,
              itemBuilder: (context, index) {
                final imageUrl = widget.menuImageUrls[index];
                return InkWell(
                  onTap: () => _openImageViewer(context, index),
                  child: CustomImageWrapper(
                    imageUrl: imageUrl,
                    aspectRatio: 3 / 4,
                    borderRadius: BorderRadius.circular(Sizes.p8),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
