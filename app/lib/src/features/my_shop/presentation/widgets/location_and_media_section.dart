// lib/features/my_shop/presentation/widgets/location_and_media_section.dart

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:app/src/features/my_shop/presentation/widgets/cover_and_gallery_image_tile.dart';
import 'package:app/src/features/my_shop/presentation/widgets/location_picker_tile.dart';
import 'package:app/src/features/my_shop/presentation/widgets/opening_hour_tile.dart';

class LocationAndMediaSection extends StatelessWidget {
  // Image State
  final String? existingCoverImageUrl;
  final Uint8List? newCoverImageBytes;
  final bool isCoverImageDeleted;
  final List<String> existingGalleryImageUrls;
  final List<Uint8List> newGalleryImageBytes;
  final List<String> galleryImageUrlsToDelete;

  // Image Callbacks
  final ValueChanged<Uint8List> onCoverImagePicked;
  final VoidCallback onCoverImageRemoved;
  final ValueChanged<List<Uint8List>> onGalleryImagesPicked;
  final ValueChanged<String> onExistingGalleryImageRemoved;
  final ValueChanged<int> onNewGalleryImageRemoved;

  // Other fields
  final LatLng? pickedLatLng;
  final List<OpeningHours> openingHours;
  final ValueChanged<LatLng> onLocationPicked;
  final ValueChanged<List<OpeningHours>> onOpeningHoursChanged;

  const LocationAndMediaSection({
    super.key,
    required this.existingCoverImageUrl,
    required this.newCoverImageBytes,
    required this.isCoverImageDeleted,
    required this.existingGalleryImageUrls,
    required this.newGalleryImageBytes,
    required this.galleryImageUrlsToDelete,
    required this.onCoverImagePicked,
    required this.onCoverImageRemoved,
    required this.onGalleryImagesPicked,
    required this.onExistingGalleryImageRemoved,
    required this.onNewGalleryImageRemoved,
    required this.pickedLatLng,
    required this.openingHours,
    required this.onLocationPicked,
    required this.onOpeningHoursChanged,
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
        const Divider(),
        CoverImageTile(
          existingImageUrl: existingCoverImageUrl,
          newImageBytes: newCoverImageBytes,
          isDeleted: isCoverImageDeleted,
          onImagePicked: onCoverImagePicked,
          onImageRemoved: onCoverImageRemoved,
        ),
        const Divider(),
        GalleryImagesTile(
          existingImageUrls: existingGalleryImageUrls,
          newImageBytes: newGalleryImageBytes,
          urlsToDelete: galleryImageUrlsToDelete,
          onImagesPicked: onGalleryImagesPicked,
          onRemoveExisting: onExistingGalleryImageRemoved,
          onRemoveNew: onNewGalleryImageRemoved,
        ),
        const Divider(),
        OpeningHoursTile(
          openingHours: openingHours,
          onOpeningHoursChanged: onOpeningHoursChanged,
        ),
      ],
    );
  }
}
