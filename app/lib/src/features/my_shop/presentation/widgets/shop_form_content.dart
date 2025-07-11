// lib/features/my_shop/presentation/shop_form_content.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:app/src/core/common_widgets/alert_dialogs.dart';
import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/core/common_widgets/responsive_scrollable.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/features/my_shop/application/shop_form_provider.dart';
import 'package:app/src/features/my_shop/presentation/shop_controller.dart';
import 'package:app/src/features/my_shop/presentation/shop_form_content_controller.dart';
import 'package:app/src/features/my_shop/presentation/widgets/basic_info_section.dart';
import 'package:app/src/features/my_shop/presentation/widgets/category_section.dart';
import 'package:app/src/features/my_shop/presentation/widgets/location_and_media_section.dart';
import 'package:app/src/features/my_shop/presentation/widgets/residence_specific_section.dart';
import 'package:app/src/features/my_shop/presentation/widgets/social_media_section.dart';
import 'package:app/src/localization/string_hardcoded.dart';

class ShopFormContent extends ConsumerWidget {
  final EntityDetail? initialShop;
  final ShopFormInitialData? initialData;

  const ShopFormContent({
    super.key,
    required this.initialShop,
    this.initialData,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formProvider = shopFormContentControllerProvider(
      initialShop: initialShop,
      initialData: initialData,
    );
    final formState = ref.watch(formProvider);
    final formController = ref.read(formProvider.notifier);
    final submissionState = ref.watch(shopControllerProvider);

    ref.listen<AsyncValue<void>>(shopControllerProvider, (prev, next) {
      if (prev is AsyncLoading && next is AsyncData) {
        if (context.canPop()) context.pop();
      }
    });

    return ResponsiveScrollable(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.p16,
        vertical: Sizes.p8,
      ),
      child: Column(
        spacing: Sizes.p12,
        children: [
          CategorySection(
            allCategories: initialData?.allCategories ?? [],
            subCategoryOptions: initialData?.subCategoryOptions ?? [],
            selectedCategory: formState.category,
            selectedSubCategory: formState.subCategory,
            onCategoryChanged: formController.onCategoryChanged,
            onSubCategoryChanged: formController.onSubCategoryChanged,
          ),
          BasicInfoSection(
            name: formState.name,
            onNameChanged: formController.updateName,
            description: formState.description,
            onDescriptionChanged: formController.updateDescription,
            phoneNumber: formState.phoneNumber,
            onPhoneNumberChanged: formController.updatePhoneNumber,
            messagingNumber: formState.messagingNumber,
            onMessagingNumberChanged: formController.updateMessagingNumber,
            cityName: formState.cityName,
            onCityNameChanged: formController.updateCityName,
            sectorName: formState.sectorName,
            onSectorNameChanged: formController.updateSectorName,
            streetAddress: formState.streetAddress,
            onStreetAddressChanged: formController.updateStreetAddress,
            email: formState.email,
            onEmailChanged: formController.updateEmail,
          ),
          SocialMediaSection(
            facebookUrl: formState.facebookUrl,
            onFacebookUrlChanged: formController.updateFacebookUrl,
            instagramUrl: formState.instagramUrl,
            onInstagramUrlChanged: formController.updateInstagramUrl,
            websiteUrl: formState.websiteUrl,
            onWebsiteUrlChanged: formController.updateWebsiteUrl,
          ),
          LocationAndMediaSection(
            existingCoverImageUrl: formState.existingCoverImageUrl,
            newCoverImageBytes: formState.newCoverImageBytes,
            isCoverImageDeleted: formState.isCoverImageDeleted,
            existingGalleryImageUrls: formState.existingGalleryImageUrls,
            newGalleryImageBytes: formState.newGalleryImageBytes,
            galleryImageUrlsToDelete: formState.galleryImageUrlsToDelete,
            onCoverImagePicked: formController.pickNewCoverImage,
            onCoverImageRemoved: formController.removeCoverImage,
            onGalleryImagesPicked: formController.pickNewGalleryImages,
            onExistingGalleryImageRemoved:
                formController.removeExistingGalleryImage,
            onNewGalleryImageRemoved: formController.removeNewGalleryImage,
            pickedLatLng: formState.latLng,
            openingHours: formState.openingHours,
            onLocationPicked: formController.onLocationPicked,
            onOpeningHoursChanged: formController.onOpeningHoursChanged,
          ),
          if (formState.category?.id == 1)
            ResidenceSpecificSection(
              price: formState.price?.toString() ?? '',
              onPriceChanged: formController.updatePrice,
              isFurnished: formState.isFurnished,
              onFurnishedChanged: formController.onFurnishedChanged,
              genderPref: formState.genderPref,
              onGenderPrefChanged: formController.onGenderPrefChanged,
            ),
          // Add other specific sections as needed
          gapH8,
          PrimaryButton(
            isLoading: submissionState.isLoading,
            onPressed: () async {
              final success = await formController.submitShop();
              if (!success && context.mounted) {
                showAlertDialog(
                  context: context,
                  title: 'Incomplete Form'.hardcoded,
                  content:
                      'Please fill all required fields, including category, location, and a cover image.'
                          .hardcoded,
                );
              }
            },
            text: initialShop != null
                ? 'Save Changes'.hardcoded
                : 'Register Shop'.hardcoded,
          ),
        ],
      ),
    );
  }
}
