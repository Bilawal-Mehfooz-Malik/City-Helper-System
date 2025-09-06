import 'package:app/src/core/common_widgets/alert_dialogs.dart';
import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/common_widgets/custom_image.dart';
import 'package:app/src/core/common_widgets/custom_outlined_button.dart';
import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/core/common_widgets/responsive_scrollable.dart';
import 'package:app/src/core/common_widgets/responsive_two_column_layout.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:app/src/core/utils/async_value_ui.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home/domain/entity.dart';
import 'package:app/src/features/home/presentation/widgets/average_rating_widget.dart';
import 'package:app/src/features/home/presentation/widgets/entity_indicator.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/features/home_detail/presentation/widgets/profile_circular_avator.dart';
import 'package:app/src/features/my_shop/application/my_shop_dashboard_provider.dart';
import 'package:app/src/features/my_shop/presentation/controllers/shop_controller.dart';
import 'package:app/src/features/my_shop/presentation/widgets/timing_toggle_widget.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:app/src/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Renders the main dashboard for the user's shop.
/// It displays the shop details if a shop is registered,
/// otherwise it shows a prompt to register one.
class MyShopDashboardScreen extends ConsumerWidget {
  const MyShopDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shopValue = ref.watch(myShopDashboardProvider);

    ref.listen<AsyncValue<void>>(
      shopControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'.hardcoded),
        surfaceTintColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: Sizes.p16),
            child: ProfileCircularAvatar(avatarSize: 30, avatarIconSize: 15),
          ),
        ],
      ),
      body: SafeArea(
        child: ResponsiveScrollable(
          showCard: true,
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.p16,
            vertical: Sizes.p8,
          ),
          paddingInsideCard: const EdgeInsets.all(Sizes.p20),
          child: AsyncValueWidget(
            value: shopValue,
            data: (shop) => shop != null
                ? _ShopDetailsView(
                    shop: shop,
                    onTap: () =>
                        context.goNamed(AppRoute.shopForm.name, extra: shop),
                  )
                : const _EmptyShopView(),
          ),
        ),
      ),
    );
  }
}

/// A view shown when the user has not yet registered a shop.
class _EmptyShopView extends StatelessWidget {
  const _EmptyShopView();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Register Your Shop'.hardcoded,
          style: context.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        gapH4,
        Text(
          'Add your shop details to get started.'.hardcoded,
          textAlign: TextAlign.center,
          style: context.textTheme.bodyLarge,
        ),
        gapH16,
        PrimaryButton(
          text: 'Register Shop'.hardcoded,
          onPressed: () => context.goNamed(AppRoute.shopForm.name),
        ),
      ],
    );
  }
}

/// Displays the details of the registered shop in a card format.
/// This widget is responsible for the overall layout and user interaction.
class _ShopDetailsView extends ConsumerWidget {
  final EntityDetail shop;
  final VoidCallback onTap;

  const _ShopDetailsView({required this.shop, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSmallScreen = MediaQuery.sizeOf(context).width <= Breakpoint.tablet;
    final statusIndicator = EntityStatusIndicator(
      entity: Entity.fromDetail(shop),
    );

    // Listen to delete status from controller
    final deleteState = ref.watch(shopControllerProvider);
    final isDeleting = deleteState.isLoading; // true when deleteShop is running

    return Column(
      spacing: Sizes.p16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          child: Stack(
            children: [
              ResponsiveTwoColumnLayout(
                spacing: Sizes.p20,
                startContent: _ShopImage(
                  imageUrl: shop.coverImageUrl,
                  isSmallScreen: isSmallScreen,
                  statusIndicator: statusIndicator,
                ),
                endContent: _ShopInfo(shop: shop),
              ),
              if (!isSmallScreen)
                Positioned(bottom: 0, right: 0, child: statusIndicator),
            ],
          ),
        ),
        Divider(),

        /// Disable this toggle while deleting
        TimingToggleWidget(
          initialStatus: shop.operationalStatus,
          onStatusChanged: (newStatus) => ref
              .read(shopControllerProvider.notifier)
              .updateShopStatus(
                shopId: shop.id,
                categoryId: shop.categoryId,
                newStatus: newStatus,
              ),
        ),

        gapH16,

        /// Delete button with loader
        CustomOutlinedButton(
          useMaxSize: true,
          text: context.loc.deleteShop,
          isLoading: isDeleting,
          isDisabled: isDeleting, // block other presses
          onPressed: () async {
            final didConfirm = await showAlertDialog(
              context: context,
              title: context.loc.deleteShopConfirmationTitle,
              content: context.loc.deleteShopConfirmationContent,
              cancelActionText: context.loc.cancel,
              defaultActionText: context.loc.delete,
            );
            if (didConfirm == true) {
              ref
                  .read(shopControllerProvider.notifier)
                  .deleteShop(shopId: shop.id, categoryId: shop.categoryId);
            }
          },
        ),
      ],
    );
  }
}

/// Displays the shop's image and, on small screens, the status indicator.
class _ShopImage extends StatelessWidget {
  const _ShopImage({
    required this.imageUrl,
    required this.isSmallScreen,
    required this.statusIndicator,
  });

  final String imageUrl;
  final bool isSmallScreen;
  final Widget statusIndicator;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        CustomImageWrapper(
          imageUrl: imageUrl,
          aspectRatio: 4 / 3,
          borderRadius: BorderRadius.circular(Sizes.p12),
        ),
        // For small screens, the indicator is overlaid on the bottom-left of the image.
        if (isSmallScreen)
          Padding(
            padding: const EdgeInsets.all(Sizes.p4),
            child: statusIndicator,
          ),
      ],
    );
  }
}

/// Displays the textual information about the shop, such as name, sector, and ratings.
class _ShopInfo extends StatelessWidget {
  const _ShopInfo({required this.shop});

  final EntityDetail shop;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          shop.name,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        gapH4,
        Text(
          '${context.loc.sector} ${shop.sectorName}, ${shop.cityName}',
          style: context.textTheme.bodyLarge,
        ),
        gapH4,
        AverageRatingWidget(
          avgRating: shop.avgRating,
          totalReviews: shop.totalReviews,
          showReviewText: true,
        ),
      ],
    );
  }
}
