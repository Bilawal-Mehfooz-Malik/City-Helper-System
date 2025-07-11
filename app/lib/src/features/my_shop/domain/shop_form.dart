import 'dart:typed_data';

import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/home/domain/sub_category.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/features/home_detail/domain/food_detail.dart';
import 'package:app/src/features/home_detail/domain/residence_detail.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_form.freezed.dart';

@freezed
abstract class ShopForm with _$ShopForm {
  const factory ShopForm({
    required String name,
    required String description,
    required String phoneNumber,
    required String messagingNumber,
    required String cityName,
    required String sectorName,
    required String streetAddress,
    required String email,
    required String facebookUrl,
    required String instagramUrl,
    required String websiteUrl,
    required Category category,
    SubCategory? subCategory,
    required LatLng latLng,
    required Uint8List coverImageBytes,
    required List<Uint8List> galleryImageBytes,
    required List<OpeningHours> openingHours,
    required GenderPreference genderPref,
    double? price,
    required bool isFurnished,
  }) = _ShopForm;
}

extension ShopFormX on ShopForm {
  EntityDetail toEntityDetail() {
    final now = DateTime.now();

    if (category.id == 1) {
      return ResidenceDetail(
        id: '',
        ownerId: '',
        categoryId: category.id,
        subCategoryId: subCategory?.id ?? -1,
        coverImageUrl: '',
        galleryImageUrls: [],
        latLng: latLng,
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
        id: '',
        ownerId: '',
        categoryId: category.id,
        subCategoryId: subCategory?.id ?? -1,
        coverImageUrl: '',
        galleryImageUrls: [],
        latLng: latLng,
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
