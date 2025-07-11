// lib/features/my_shop/presentation/shop_form_content_controller.dart

import 'dart:typed_data';
import 'package:app/src/features/home_detail/domain/food_detail.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:app/src/features/my_shop/application/shop_form_provider.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/home/domain/sub_category.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/features/home_detail/domain/residence_detail.dart';
import 'package:app/src/features/my_shop/domain/shop_form.dart';
import 'package:app/src/features/my_shop/presentation/shop_controller.dart';

part 'shop_form_content_controller.g.dart';

@riverpod
class ShopFormContentController extends _$ShopFormContentController {
  @override
  ShopForm build({
    required EntityDetail? initialShop,
    required ShopFormInitialData? initialData,
  }) {
    if (initialShop != null && initialData != null) {
      // Edit Mode: Populate state from existing shop data
      return ShopForm(
        existingCoverImageUrl: initialShop.coverImageUrl,
        existingGalleryImageUrls: initialShop.galleryImageUrls,
        name: initialShop.name,
        description: initialShop.description,
        phoneNumber: initialShop.phoneNumber ?? '',
        messagingNumber: initialShop.messagingNumber ?? '',
        cityName: initialShop.cityName,
        sectorName: initialShop.sectorName,
        streetAddress: initialShop.streetAddress,
        email: initialShop.email ?? '',
        facebookUrl: initialShop.facebookUrl ?? '',
        instagramUrl: initialShop.instagramUrl ?? '',
        websiteUrl: initialShop.websiteUrl ?? '',
        category: initialData.selectedCategory,
        subCategory: initialData.selectedSubCategory,
        latLng: initialShop.latLng,
        openingHours: initialShop.openingHours,
        price: initialShop is ResidenceDetail ? initialShop.price : null,
        isFurnished: initialShop is ResidenceDetail
            ? initialShop.isFurnished
            : false,
        genderPref: initialShop is ResidenceDetail
            ? initialShop.genderPref
            : initialShop is FoodDetail
            ? initialShop.genderPref
            : GenderPreference.any,
      );
    } else {
      return ShopForm.empty();
    }
  }

  // --- Image Handling Methods ---
  void pickNewCoverImage(Uint8List bytes) => state = state.copyWith(
    newCoverImageBytes: bytes,
    isCoverImageDeleted: true,
  );
  void removeCoverImage() => state = state.copyWith(
    newCoverImageBytes: null,
    isCoverImageDeleted: true,
  );
  void pickNewGalleryImages(List<Uint8List> newImages) =>
      state = state.copyWith(
        newGalleryImageBytes: [...state.newGalleryImageBytes, ...newImages],
      );
  void removeExistingGalleryImage(String url) => state = state.copyWith(
    galleryImageUrlsToDelete: [...state.galleryImageUrlsToDelete, url],
  );

  void removeNewGalleryImage(int index) {
    final updatedList = List<Uint8List>.from(state.newGalleryImageBytes);
    updatedList.removeAt(index);
    state = state.copyWith(newGalleryImageBytes: updatedList);
  }

  // --- Other Field Update Methods ---
  void updateName(String val) => state = state.copyWith(name: val);
  void updateDescription(String val) =>
      state = state.copyWith(description: val);
  void updatePhoneNumber(String val) =>
      state = state.copyWith(phoneNumber: val);
  void updateMessagingNumber(String val) =>
      state = state.copyWith(messagingNumber: val);
  void updateCityName(String val) => state = state.copyWith(cityName: val);
  void updateSectorName(String val) => state = state.copyWith(sectorName: val);
  void updateStreetAddress(String val) =>
      state = state.copyWith(streetAddress: val);
  void updateEmail(String val) => state = state.copyWith(email: val);
  void updateFacebookUrl(String val) =>
      state = state.copyWith(facebookUrl: val);
  void updateInstagramUrl(String val) =>
      state = state.copyWith(instagramUrl: val);
  void updateWebsiteUrl(String val) => state = state.copyWith(websiteUrl: val);
  void updatePrice(String val) =>
      state = state.copyWith(price: double.tryParse(val));
  void onCategoryChanged(Category? cat) =>
      state = state.copyWith(category: cat, subCategory: null);
  void onSubCategoryChanged(SubCategory? sub) =>
      state = state.copyWith(subCategory: sub);
  void onLocationPicked(LatLng latLng) =>
      state = state.copyWith(latLng: latLng);
  void onOpeningHoursChanged(List<OpeningHours> hours) =>
      state = state.copyWith(openingHours: hours);
  void onFurnishedChanged(bool furnished) =>
      state = state.copyWith(isFurnished: furnished);
  void onGenderPrefChanged(GenderPreference pref) =>
      state = state.copyWith(genderPref: pref);

  // --- Submission Logic ---
  Future<bool> submitShop() async {
    final submissionNotifier = ref.read(shopControllerProvider.notifier);

    // Validation now checks the complex image state
    final hasCoverImage =
        state.newCoverImageBytes != null ||
        (state.existingCoverImageUrl != null && !state.isCoverImageDeleted);
    if (!hasCoverImage ||
        state.category == null ||
        state.latLng == null ||
        state.name.isEmpty) {
      return false;
    }

    final shopEntity = state.toEntityDetail();

    // IMPORTANT: Your repository's setShop method must be updated to handle these new parameters.
    return await submissionNotifier.setShop(
      shop: shopEntity,
      newCoverImageBytes: state.newCoverImageBytes,
      newGalleryImagesBytes: state.newGalleryImageBytes,
      galleryImageUrlsToDelete: state.galleryImageUrlsToDelete,
      isCoverImageDeleted: state.isCoverImageDeleted,
    );
  }
}
