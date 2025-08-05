import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FakeMapWidget extends StatelessWidget {
  final LatLng latLng;
  const FakeMapWidget({super.key, required this.latLng});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Sizes.p8),
      child: ColoredBox(
        color: context.colorScheme.surfaceContainerHighest,
        child: Center(
          child: Text(
            'Fake Map, at (${latLng.latitude}, ${latLng.longitude})'.hardcoded,
          ),
        ),
      ),
    );
  }
}
