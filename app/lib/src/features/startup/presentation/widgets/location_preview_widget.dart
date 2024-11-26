import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common_widgets/custom_progress_indicator.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../localization/localization_extension.dart';
import '../../data/fake_location_repository.dart';

class LocationPreviewWidget extends ConsumerWidget {
  final bool isLoading;
  const LocationPreviewWidget({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLocation = ref.watch(fakeLocationRepositoryProvider).userLocation;

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(Sizes.p8),
        ),
        child: Center(
          child: isLoading
              ? const CustomProgressIndicator()
              : userLocation == null
                  ? Text(context.loc.notChoosen)
                  : Text('Lat ${userLocation.latitude}'),
        ),
      ),
    );
  }
}
