import 'dart:typed_data';

import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/home/domain/sub_category.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/features/home_detail/domain/food_detail.dart';
import 'package:app/src/features/home_detail/domain/residence_detail.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'shop_form.freezed.dart';

@freezed
abstract class ShopForm with _$ShopForm {
  const factory ShopForm({
    // Page 1
    Category? category,
    SubCategory? subCategory,
    required String name,
    required String description,
    required String phoneNumber,
    required String messagingNumber,
    required String cityName,
    required String sectorName,
    required String streetAddress,
    required String email,

    // Page 2
    required LatLng? latLng,
    Uint8List? coverImageBytes,
    @Default([]) List<Uint8List> galleryImageBytes,
    @Default([]) List<String> galleryUrlsToDelete, // For editing
    required List<OpeningHours> openingHours,
    required String facebookUrl,
    required String instagramUrl,
    required String websiteUrl,

    // Page 3
    double? price,
    required bool isFurnished,
    required GenderPreference genderPref,
  }) = _ShopForm;

  factory ShopForm.fromEntityDetail(EntityDetail shop) {
    double? price;
    bool isFurnished = false;
    if (shop is ResidenceDetail) {
      price = shop.price;
      isFurnished = shop.isFurnished;
    }

    return ShopForm(
      name: shop.name,
      description: shop.description,
      phoneNumber: shop.phoneNumber ?? '',
      messagingNumber: shop.messagingNumber ?? '',
      cityName: shop.cityName,
      sectorName: shop.sectorName,
      streetAddress: shop.streetAddress,
      email: shop.email ?? '',
      facebookUrl: shop.facebookUrl ?? '',
      instagramUrl: shop.instagramUrl ?? '',
      websiteUrl: shop.websiteUrl ?? '',
      latLng: shop.latLng,
      openingHours: shop.openingHours,
      genderPref: shop is ResidenceDetail
          ? shop.genderPref
          : shop is FoodDetail
          ? shop.genderPref
          : GenderPreference.any,
      price: price,
      isFurnished: isFurnished,
    );
  }

  factory ShopForm.defaults() {
    List<OpeningHours> setDefaultOpeningHours() {
      final now = DateTime.now();
      final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
      return List.generate(7, (index) {
        final dayDate = startOfWeek.add(Duration(days: index));
        final day = DateFormat('EEEE').format(dayDate);
        // FIX: Storing default times in 24-hour "HH:mm" format.
        return OpeningHours(day: day, open: '09:00', close: '21:00');
      });
    }

    return ShopForm(
      name: '',
      description: '',
      phoneNumber: '',
      messagingNumber: '',
      cityName: '',
      sectorName: '',
      streetAddress: '',
      email: '',
      facebookUrl: '',
      instagramUrl: '',
      websiteUrl: '',
      latLng: null,
      openingHours: setDefaultOpeningHours(),
      genderPref: GenderPreference.any,
      isFurnished: false,
    );
  }
}

extension ShopFormX on ShopForm {
  EntityDetail toEntityDetail(EntityDetail? existingShop) {
    final now = DateTime.now();

    if (existingShop != null) {
      if (existingShop is ResidenceDetail) {
        return existingShop.copyWith(
          subCategoryId: subCategory?.id ?? -1,
          name: name,
          description: description,
          phoneNumber: phoneNumber,
          messagingNumber: messagingNumber,
          cityName: cityName,
          sectorName: sectorName,
          streetAddress: streetAddress,
          email: email,
          facebookUrl: facebookUrl,
          instagramUrl: instagramUrl,
          websiteUrl: websiteUrl,
          latLng: latLng!,
          openingHours: openingHours,
          genderPref: genderPref,
          price: price ?? existingShop.price,
          isFurnished: isFurnished,
        );
      } else if (existingShop is FoodDetail) {
        return existingShop.copyWith(
          subCategoryId: subCategory?.id ?? -1,
          name: name,
          description: description,
          phoneNumber: phoneNumber,
          messagingNumber: messagingNumber,
          cityName: cityName,
          sectorName: sectorName,
          streetAddress: streetAddress,
          email: email,
          facebookUrl: facebookUrl,
          instagramUrl: instagramUrl,
          websiteUrl: websiteUrl,
          latLng: latLng!,
          openingHours: openingHours,
          genderPref: genderPref,
        );
      }
      return existingShop;
    } else {
      if (category!.id == 1) {
        return ResidenceDetail(
          type: EntityType.residence, // Using your new EntityType
          id: '',
          ownerId: '',
          categoryId: category!.id,
          subCategoryId: subCategory?.id ?? -1,
          coverImageUrl: '',
          galleryImageUrls: [],
          latLng: latLng!,
          name: name,
          description: description,
          cityName: cityName,
          sectorName: sectorName,
          streetAddress: streetAddress,
          avgRating: 0,
          totalReviews: 0,
          ratingBreakdown: const [],
          isPopular: false,
          status: Status.pending,
          entityStatus: EntityStatus.defaultStatus,
          openingHours: openingHours,
          updatedAt: now,
          createdAt: now,
          phoneNumber: phoneNumber,
          messagingNumber: messagingNumber,
          email: email,
          facebookUrl: facebookUrl,
          instagramUrl: instagramUrl,
          websiteUrl: websiteUrl,
          genderPref: genderPref,
          price: price ?? 0,
          isFurnished: isFurnished,
        );
      } else {
        return FoodDetail(
          type: EntityType.food, // Using your new EntityType
          id: '',
          ownerId: '',
          categoryId: category!.id,
          subCategoryId: subCategory?.id ?? -1,
          coverImageUrl: '',
          galleryImageUrls: [],
          latLng: latLng!,
          name: name,
          description: description,
          cityName: cityName,
          sectorName: sectorName,
          streetAddress: streetAddress,
          avgRating: 0,
          totalReviews: 0,
          ratingBreakdown: const [],
          isPopular: false,
          status: Status.pending,
          entityStatus: EntityStatus.defaultStatus,
          openingHours: openingHours,
          updatedAt: now,
          createdAt: now,
          phoneNumber: phoneNumber,
          messagingNumber: messagingNumber,
          email: email,
          facebookUrl: facebookUrl,
          instagramUrl: instagramUrl,
          websiteUrl: websiteUrl,
          genderPref: genderPref,
        );
      }
    }
  }
}
