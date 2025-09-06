import 'dart:typed_data';

import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:app/src/core/constants/default_opening_hours.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/home/domain/pricing.dart';
import 'package:app/src/features/home/domain/sub_category.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_form.freezed.dart';

@freezed
abstract class ShopForm with _$ShopForm {
  const factory ShopForm({
    // Step 1: Basic Details
    Category? category,
    SubCategory? subCategory,
    required String name,
    required String description,
    ListingType? listingType,

    // Step 2: Location Info
    required String cityName,
    required String sectorName,
    required String streetAddress,
    required LatLng? latLng,

    // Step 3: Contact & Social Links
    required String phoneNumber,
    required String waNumber,
    required String email,
    required String facebookUrl,
    required String instagramUrl,
    required String websiteUrl,

    // Step 4: Business Specific Info
    Map<DayOfWeek, OpeningHours>? openingHours,
    Pricing? pricing,
    required bool isFurnished,
    GenderPreference? genderPref,
    @Default(true) bool isRoomAvailable,

    // Step 5: Media Uploads
    Uint8List? coverImageBytes,
    // TODO: Add menuImagesUrls
    @Default([]) List<Uint8List> galleryImageBytes,
    @Default([]) List<String> galleryUrlsToDelete,
  }) = _ShopForm;

  factory ShopForm.fromEntityDetail(EntityDetail shop) {
    Pricing? pricing;
    bool isFurnished = false;
    ListingType? listingType;
    if (shop is ResidenceDetail) {
      pricing = shop.pricing;
      isFurnished = shop.isFurnished;
      listingType = shop.listingType;
    }

    return ShopForm(
      name: shop.name,
      description: shop.description,
      phoneNumber: shop.phoneNumber ?? '',
      waNumber: shop.waNumber ?? '',
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
          ? shop.genderPreference
          : shop is FoodDetail
          ? shop.genderPreference
          : null,
      pricing: pricing,
      isFurnished: isFurnished,
      listingType: listingType,
      isRoomAvailable: (shop is ResidenceDetail)
          ? shop.isRoomAvailable
          : true, // Default to true if not residence
    );
  }

  factory ShopForm.defaults() {
    return ShopForm(
      name: '',
      description: '',
      phoneNumber: '',
      waNumber: '',
      cityName: '',
      sectorName: '',
      streetAddress: '',
      email: '',
      facebookUrl: '',
      instagramUrl: '',
      websiteUrl: '',
      latLng: null,
      openingHours: defaultOpeningHours,
      genderPref: null,
      isFurnished: false,
      listingType: ListingType.forRent,
      isRoomAvailable: true, // Default to true
    );
  }
}
