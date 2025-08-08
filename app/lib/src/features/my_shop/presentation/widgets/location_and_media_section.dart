/*
import 'dart:typed_data';

import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:app/src/features/my_shop/presentation/widgets/cover_and_gallery_image_tile.dart';
import 'package:app/src/features/my_shop/presentation/widgets/location_picker_tile.dart';
import 'package:app/src/features/my_shop/presentation/widgets/opening_hour_tile.r
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationAndMediaSection extends StatelessWidget {
  final LatLng? pickedLatLng;
  final Uint8List? coverImageBytes;
  final List<Uint8List> galleryImagesBytes;
  final List<OpeningHours> openingHours;
  final String? coverImageUrl;
  final List<String> galleryImageUrls;
  final ValueChanged<LatLng?> onLocationPicked;
  final ValueChanged<Uint8List?> onCoverImagePicked;
  final ValueChanged<List<Uint8List>> onGalleryImagesPicked;
  final ValueChanged<List<OpeningHours>> onOpeningHoursChanged;
  final ValueChanged<String> onExistingGalleryImageDeleted;

  const LocationAndMediaSection({
    super.key,
    required this.pickedLatLng,
    required this.coverImageBytes,
    required this.galleryImagesBytes,
    required this.openingHours,
    this.coverImageUrl,
    this.galleryImageUrls = const [],
    required this.onLocationPicked,
    required this.onCoverImagePicked,
    required this.onGalleryImagesPicked,
    required this.onOpeningHoursChanged,
    required this.onExistingGalleryImageDeleted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: Sizes.p8,
      children: [
        LocationPickerTile(
          pickedLatLng: pickedLatLng,
          onLocationPicked: onLocationPicked,
        ),
        CoverImageTile(
          coverImageBytes: coverImageBytes,
          onCoverImagePicked: onCoverImagePicked,
          coverImageUrl: coverImageUrl,
        ),
        GalleryImagesTile(
          galleryImageBytes: galleryImagesBytes,
          onGalleryImagesPicked: onGalleryImagesPicked,
          galleryImagesUrl: galleryImageUrls,
          onExistingImageDeleted: onExistingGalleryImageDeleted,
        ),
        OpeningHoursTile(
          openingHours: openingHours,
          onOpeningHoursChanged: onOpeningHoursChanged,
        ),
      ],
    );
  }
}
*/