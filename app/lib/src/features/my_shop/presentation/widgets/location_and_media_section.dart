import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:app/src/features/my_shop/presentation/widgets/cover_and_gallery_image_tile.dart';
import 'package:app/src/features/my_shop/presentation/widgets/location_picker_tile.dart';
import 'package:app/src/features/my_shop/presentation/widgets/opening_hour_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationAndMediaSection extends StatelessWidget {
  final LatLng? pickedLatLng;
  final String? coverImagePath;
  final List<String> galleryImagePaths;
  final List<OpeningHours> openingHours;
  final ValueChanged<LatLng?> onLocationPicked;
  final ValueChanged<String?> onCoverImagePicked;
  final ValueChanged<List<String>> onGalleryImagesPicked;
  final ValueChanged<List<OpeningHours>> onOpeningHoursChanged;

  const LocationAndMediaSection({
    super.key,
    required this.pickedLatLng,
    required this.coverImagePath,
    required this.galleryImagePaths,
    required this.openingHours,
    required this.onLocationPicked,
    required this.onCoverImagePicked,
    required this.onGalleryImagesPicked,
    required this.onOpeningHoursChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: Sizes.p8,
      children: [
        gapH8,
        LocationPickerTile(
          pickedLatLng: pickedLatLng,
          onLocationPicked: onLocationPicked,
        ),
        CoverImageTile(
          coverImagePath: coverImagePath,
          onCoverImagePicked: onCoverImagePicked,
        ),
        GalleryImagesTile(
          galleryImagePaths: galleryImagePaths,
          onGalleryImagesPicked: onGalleryImagesPicked,
        ),
        OpeningHoursTile(
          openingHours: openingHours,
          onOpeningHoursChanged: onOpeningHoursChanged,
        ),
      ],
    );
  }
}
