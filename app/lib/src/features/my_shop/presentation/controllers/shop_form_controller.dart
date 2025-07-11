import 'dart:typed_data';

import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/home/domain/sub_category.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/features/home_detail/domain/food_detail.dart';
import 'package:app/src/features/home_detail/domain/residence_detail.dart';
import 'package:app/src/features/my_shop/domain/shop_form.dart';
import 'package:app/src/features/my_shop/presentation/controllers/shop_form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shop_form_controller.g.dart';

/// Controller for the Shop Form UI state and logic.
@riverpod
class ShopFormController extends _$ShopFormController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final phoneController = TextEditingController();
  final messagingNumberController = TextEditingController();
  final cityNameController = TextEditingController();
  final sectorNameController = TextEditingController();
  final streetAddressController = TextEditingController();
  final priceController = TextEditingController();
  final emailController = TextEditingController();
  final facebookController = TextEditingController();
  final instagramController = TextEditingController();
  final websiteController = TextEditingController();

  @override
  ShopFormState build() {
    ref.onDispose(() {
      nameController.dispose();
      descriptionController.dispose();
      phoneController.dispose();
      messagingNumberController.dispose();
      cityNameController.dispose();
      sectorNameController.dispose();
      streetAddressController.dispose();
      priceController.dispose();
      emailController.dispose();
      facebookController.dispose();
      instagramController.dispose();
      websiteController.dispose();
    });
    return const ShopFormState();
  }

  void initialize(
    EntityDetail? initialShop,
    Category? cat,
    SubCategory? subCat,
  ) {
    if (initialShop != null) {
      nameController.text = initialShop.name;
      descriptionController.text = initialShop.description;
      phoneController.text = initialShop.phoneNumber ?? '';
      messagingNumberController.text = initialShop.messagingNumber ?? '';
      cityNameController.text = initialShop.cityName;
      sectorNameController.text = initialShop.sectorName;
      streetAddressController.text = initialShop.streetAddress;
      emailController.text = initialShop.email ?? '';
      facebookController.text = initialShop.facebookUrl ?? '';
      instagramController.text = initialShop.instagramUrl ?? '';
      websiteController.text = initialShop.websiteUrl ?? '';

      state = state.copyWith(
        selectedCategory: cat,
        selectedSubCategory: subCat,
        pickedLatLng: () => initialShop.latLng,
        openingHours: initialShop.openingHours,
      );

      if (initialShop is ResidenceDetail) {
        priceController.text = initialShop.price.toString();
        state = state.copyWith(
          isFurnished: initialShop.isFurnished,
          genderPref: initialShop.genderPref,
        );
      } else if (initialShop is FoodDetail) {
        state = state.copyWith(genderPref: initialShop.genderPref);
      }
    } else {
      _setDefaultOpeningHours();
    }
  }

  void _setDefaultOpeningHours() {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final hours = List.generate(7, (index) {
      final dayDate = startOfWeek.add(Duration(days: index));
      final day = DateFormat('EEEE').format(dayDate);
      return OpeningHours(day: day, open: '09:00 AM', close: '21:00 PM');
    });
    state = state.copyWith(openingHours: hours);
  }

  // --- State Update Methods ---
  void onCategoryChanged(Category? category) => state = state.copyWith(
    selectedCategory: category,
    selectedSubCategory: null,
  );
  void onSubCategoryChanged(SubCategory? subCategory) {
    state = state.copyWith(selectedSubCategory: subCategory);
  }

  void onLocationPicked(LatLng? latLng) {
    state = state.copyWith(pickedLatLng: () => latLng);
  }

  void onCoverImagePicked(Uint8List? bytes) {
    state = state.copyWith(coverImageBytes: () => bytes);
  }

  void onGalleryImagesPicked(List<Uint8List> bytesList) {
    state = state.copyWith(galleryImageBytes: bytesList);
  }

  void onExistingGalleryImageDeleted(String imageUrl) => state = state.copyWith(
    galleryUrlsToDelete: [...state.galleryUrlsToDelete, imageUrl],
  );
  void onOpeningHoursChanged(List<OpeningHours> hours) {
    state = state.copyWith(openingHours: hours);
  }

  void onFurnishedChanged(bool val) => state = state.copyWith(isFurnished: val);
  void onGenderPrefChanged(GenderPreference? val) {
    state = state.copyWith(genderPref: val ?? GenderPreference.any);
  }

  // --- Main Submission Logic ---
  Future<bool> submitShop({
    required bool isEditing,
    EntityDetail? initialShop,
  }) async {
    final coverImageRequired = !isEditing && state.coverImageBytes == null;

    if (!formKey.currentState!.validate() ||
        state.selectedCategory == null ||
        state.pickedLatLng == null ||
        coverImageRequired) {
      // Consider showing a snackbar here
      return false;
    }

    final formData = ShopForm(
      name: nameController.text.trim(),
      description: descriptionController.text.trim(),
      phoneNumber: phoneController.text.trim(),
      messagingNumber: messagingNumberController.text.trim(),
      cityName: cityNameController.text.trim(),
      sectorName: sectorNameController.text.trim(),
      streetAddress: streetAddressController.text.trim(),
      email: emailController.text.trim(),
      facebookUrl: facebookController.text.trim(),
      instagramUrl: instagramController.text.trim(),
      websiteUrl: websiteController.text.trim(),
      category: state.selectedCategory!,
      subCategory: state.selectedSubCategory,
      latLng: state.pickedLatLng!,
      openingHours: state.openingHours,
      genderPref: state.genderPref,
      price: double.tryParse(priceController.text.trim()),
      isFurnished: state.isFurnished,
      coverImageBytes: state.coverImageBytes ?? Uint8List(0),
      galleryImageBytes: state.galleryImageBytes,
    );

    late EntityDetail shopToSave;

    if (isEditing) {
      final existingShop = initialShop!;
      if (existingShop is ResidenceDetail) {
        shopToSave = existingShop.copyWith(
          name: formData.name,
          description: formData.description,
          phoneNumber: formData.phoneNumber,
          messagingNumber: formData.messagingNumber,
          cityName: formData.cityName,
          sectorName: formData.sectorName,
          streetAddress: formData.streetAddress,
          email: formData.email,
          facebookUrl: formData.facebookUrl,
          instagramUrl: formData.instagramUrl,
          websiteUrl: formData.websiteUrl,
          latLng: formData.latLng,
          openingHours: formData.openingHours,
          genderPref: formData.genderPref,
          price: formData.price ?? existingShop.price,
          isFurnished: formData.isFurnished,
        );
      } else if (existingShop is FoodDetail) {
        shopToSave = existingShop.copyWith(
          name: formData.name,
          description: formData.description,
          phoneNumber: formData.phoneNumber,
          messagingNumber: formData.messagingNumber,
          cityName: formData.cityName,
          sectorName: formData.sectorName,
          streetAddress: formData.streetAddress,
          email: formData.email,
          facebookUrl: formData.facebookUrl,
          instagramUrl: formData.instagramUrl,
          websiteUrl: formData.websiteUrl,
          latLng: formData.latLng,
          openingHours: formData.openingHours,
          genderPref: formData.genderPref,
        );
      } else {
        return false;
      }
    } else {
      shopToSave = formData.toEntityDetail();
    }

    // Call the backend controller
    return ref
        .read(shopScreenControllerProvider.notifier)
        .setShop(
          shop: shopToSave,
          categoryId: state.selectedCategory!.id,
          coverImageBytes: state.coverImageBytes,
          galleryImagesBytes: state.galleryImageBytes,
          galleryUrlsToDelete: state.galleryUrlsToDelete,
        );
  }
}
