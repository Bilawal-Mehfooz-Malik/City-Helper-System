import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/common_widgets/custom_image.dart';
import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/core/common_widgets/responsive_center.dart';
import 'package:app/src/core/common_widgets/responsive_scrollable.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/features/my_shop/application/shop_service.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:app/src/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MyShopDashboardScreen extends ConsumerWidget {
  const MyShopDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValue = ref.watch(authStateChangesProvider);

    return Scaffold(
      appBar: AppBar(title: Text('My Shop'.hardcoded)),
      body: SafeArea(
        child: ResponsiveScrollable(
          showCard: true,
          padding: EdgeInsets.symmetric(horizontal: Sizes.p16),
          paddingInsideCard: EdgeInsets.all(Sizes.p16),
          child: AsyncValueWidget(
            value: userAsyncValue,
            data: (user) {
              if (user == null) {
                return const SizedBox.shrink();
              }

              final userShopAsync = ref.watch(WatchUserShopProvider(user.uid));
              return Column(
                spacing: Sizes.p12,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// 🔹 User Profile Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: Sizes.p12,
                    children: [
                      if (user.profileImageUrl != null)
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: CustomImage(
                            imageUrl: user.profileImageUrl!,
                            useCircleLoading: true,
                          ),
                        ),
                      Column(
                        spacing: Sizes.p4,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(user.name, style: context.textTheme.titleLarge),
                          Text(user.phoneNumber),
                        ],
                      ),
                    ],
                  ),

                  const Divider(),

                  /// 🔹 Shop Status Section
                  AsyncValueWidget(
                    value: userShopAsync,
                    data: (shop) => shop != null
                        ? _ShopDetailCard(shop: shop)
                        : _NoShopCard(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ShopDetailCard extends StatelessWidget {
  final EntityDetail shop;

  const _ShopDetailCard({required this.shop});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomImage(imageUrl: shop.coverImageUrl, aspectRatio: 1),
      title: Text(shop.name),
      subtitle: Text(
        '${shop.cityName},${context.loc.sector} ${shop.sectorName}',
      ),
      trailing: Icon(Icons.edit),
      onTap: () => context.goNamed(AppRoute.shopForm.name, extra: shop),
    );
  }
}

class _NoShopCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveCenter(
      padding: EdgeInsets.all(Sizes.p16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You have not registered any shop yet.'.hardcoded,
            textAlign: TextAlign.center,
            style: context.textTheme.titleLarge,
          ),
          gapH8,
          PrimaryButton(
            text: 'Register your shop'.hardcoded,
            onPressed: () => context.goNamed(AppRoute.shopForm.name),
          ),
        ],
      ),
    );
  }
}
