import 'dart:typed_data';

import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/home/domain/sub_category.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

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
    required List<OpeningHours> openingHours,
    double? price,
    required bool isFurnished,
    required GenderPreference genderPref,

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
      openingHours: shop.openingHours ?? _setDefaultOpeningHours(),
      genderPref: shop is ResidenceDetail
          ? shop.genderPref ?? GenderPreference.any
          : shop is FoodDetail
          ? shop.genderPref
          : GenderPreference.any,
      price: price,
      isFurnished: isFurnished,
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
      openingHours: _setDefaultOpeningHours(),
      genderPref: GenderPreference.any,
      isFurnished: false,
    );
  }
}

List<OpeningHours> _setDefaultOpeningHours() {
  final now = DateTime.now();
  final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
  return List.generate(7, (index) {
    final dayDate = startOfWeek.add(Duration(days: index));
    final day = DateFormat('EEEE').format(dayDate);
    return OpeningHours(day: day, open: '09:00', close: '21:00');
  });
}
