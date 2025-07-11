import 'dart:typed_data';

import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/home/domain/sub_category.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@immutable
class ShopFormState {
  const ShopFormState({
    this.selectedCategory,
    this.selectedSubCategory,
    this.pickedLatLng,
    this.coverImageBytes,
    this.galleryImageBytes = const [],
    this.galleryUrlsToDelete = const [],
    this.openingHours = const [],
    this.isFurnished = false,
    this.genderPref = GenderPreference.any,
  });

  final Category? selectedCategory;
  final SubCategory? selectedSubCategory;
  final LatLng? pickedLatLng;
  final Uint8List? coverImageBytes;
  final List<Uint8List> galleryImageBytes;
  final List<String> galleryUrlsToDelete;
  final List<OpeningHours> openingHours;
  final bool isFurnished;
  final GenderPreference genderPref;

  ShopFormState copyWith({
    Category? selectedCategory,
    SubCategory? selectedSubCategory,
    // Use ValueGetter to distinguish between null and not provided
    ValueGetter<LatLng?>? pickedLatLng,
    ValueGetter<Uint8List?>? coverImageBytes,
    List<Uint8List>? galleryImageBytes,
    List<String>? galleryUrlsToDelete,
    List<OpeningHours>? openingHours,
    bool? isFurnished,
    GenderPreference? genderPref,
  }) {
    return ShopFormState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedSubCategory: selectedSubCategory ?? this.selectedSubCategory,
      pickedLatLng: pickedLatLng != null ? pickedLatLng() : this.pickedLatLng,
      coverImageBytes: coverImageBytes != null
          ? coverImageBytes()
          : this.coverImageBytes,
      galleryImageBytes: galleryImageBytes ?? this.galleryImageBytes,
      galleryUrlsToDelete: galleryUrlsToDelete ?? this.galleryUrlsToDelete,
      openingHours: openingHours ?? this.openingHours,
      isFurnished: isFurnished ?? this.isFurnished,
      genderPref: genderPref ?? this.genderPref,
    );
  }
}
