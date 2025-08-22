import 'dart:typed_data';

import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:app/src/core/constants/default_opening_hours.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
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

    // Step 2: Location Info
    required String cityName,
    required String sectorName,
    required String streetAddress,
    required LatLng? latLng,

    // Step 3: Contact & Social Links
    required String phoneNumber,
    required String messagingNumber,
    required String email,
    required String facebookUrl,
    required String instagramUrl,
    required String websiteUrl,

    // Step 4: Business Specific Info
    Map<DayOfWeek, OpeningHours>? openingHours,
    double? pricing,
    required bool isFurnished,
    required GenderPreference genderPref,
    @Default("Asia/Karachi") String timezone,
    @Default(true) bool isRoomAvailable, // New field
    bool? isOpen,
    @Default({}) Map<String, String> scheduledTaskNames,

    // Step 5: Media Uploads
    Uint8List? coverImageBytes,
    @Default([]) List<Uint8List> galleryImageBytes,
    @Default([]) List<String> galleryUrlsToDelete, // For editing
  }) = _ShopForm;

  factory ShopForm.fromEntityDetail(EntityDetail shop) {
    double? price;
    bool isFurnished = false;
    if (shop is ResidenceDetail) {
      price = shop.pricing;
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
      pricing: price,
      isFurnished: isFurnished,
      timezone: shop.timezone,
      isRoomAvailable: (shop is ResidenceDetail) ? shop.isRoomAvailable : true, // Default to true if not residence
      isOpen: (shop is FoodDetail) ? (shop as FoodDetail).isOpen : null,
      scheduledTaskNames: shop.scheduledTaskNames,
    );
  }

  factory ShopForm.defaults() {
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
      openingHours: defaultOpeningHours,
      genderPref: GenderPreference.any,
      isFurnished: false,
      timezone: "Asia/Karachi",
      isRoomAvailable: true, // Default to true
      isOpen: null,
      scheduledTaskNames: {},
    );
  }
}