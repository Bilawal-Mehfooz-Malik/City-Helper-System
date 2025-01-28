import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/startup/domain/geolocation.dart';
import 'package:app/src/features/startup/domain/place_dto.dart';
import 'package:app/src/features/startup/presentation/location_controller.dart';
import 'package:app/src/features/startup/presentation/pick_location/controllers/search_focus_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SuggestionListTile extends ConsumerWidget {
  final Future<void> Function(GeoLocation) onTapSuggestion;
  const SuggestionListTile({
    super.key,
    required this.place,
    required this.onTapSuggestion,
  });

  final PlaceSuggestion place;

  void _updateFocus(bool isFocused, WidgetRef ref) {
    final focusNotifier = ref.read(searchFocusNotifierProvider);
    if (focusNotifier != isFocused) {
      ref.read(searchFocusNotifierProvider.notifier).setFocus(isFocused);
    }
  }

  void _onTap(
      BuildContext context, WidgetRef ref, PlaceSuggestion place) async {
    /// Fetching [PlaceDetails]
    final res = await ref
        .read(locationControllerProvider.notifier)
        .fetchPlaceDetails(place);

    /// calling [MoveCamera] method on [GoogleMapController]
    if (res != null && res.geoLocation != null && context.mounted) {
      context.pop();
      await onTapSuggestion(res.geoLocation!);
      _updateFocus(false, ref);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(locationControllerProvider).isLoading;
    return ListTile(
      leading: SizedBox(
        height: 40,
        width: 40,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Icon(Icons.location_on_outlined),
        ),
      ),
      title: Text(place.name),
      subtitle: place.streetAddress != null ? Text(place.streetAddress!) : null,
      onTap: isLoading ? null : () => _onTap(context, ref, place),
    );
  }
}
