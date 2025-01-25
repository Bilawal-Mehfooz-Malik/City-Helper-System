import 'package:app/src/features/startup/domain/geolocation.dart';
import 'package:app/src/features/startup/domain/place_dto.dart';
import 'package:app/src/features/startup/presentation/location_controller.dart';
import 'package:app/src/features/startup/presentation/pick_location/controllers/location_search_query_notifier.dart';
import 'package:app/src/features/startup/presentation/pick_location/controllers/search_focus_notifier.dart';
import 'package:app/src/features/startup/presentation/pick_location/search_bar/suggestion_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_sizes.dart';

class SearchSuggestionListView extends StatelessWidget {
  final Future<void> Function(GeoLocation) onTapSuggestion;

  const SearchSuggestionListView({super.key, required this.onTapSuggestion});

  void _updateFocus(bool isFocused, WidgetRef ref) {
    final focusNotifier = ref.read(searchFocusNotifierProvider);
    if (focusNotifier != isFocused) {
      ref.read(searchFocusNotifierProvider.notifier).setFocus(isFocused);
    }
  }

  void _onTap(
      BuildContext context, WidgetRef ref, PlaceSuggestion place) async {
    // Fetching [PlaceDetails]
    final res = await ref
        .read(locationControllerProvider.notifier)
        .fetchPlaceDetails(place);

    // calling [MoveCamera] method on [GoogleMapController]
    if (res != null && res.geoLocation != null && context.mounted) {
      context.pop();
      await onTapSuggestion(res.geoLocation!);
      _updateFocus(false, ref);
    } else {
      // TODO: update exception
      throw Exception('Failed to fetch place details or invalid geolocation.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final searchResults = ref.watch(locationSearchResultsProvider);

        if (searchResults.error != null) {
          // TODO: update exception
          return SuggetionMessageWidget('Error: ${searchResults.error}');
        }

        final places = searchResults.value;
        if (places == null || places.isEmpty) {
          // TODO: update exception
          return SuggetionMessageWidget('No results found');
        }

        return ListView.builder(
          shrinkWrap: true,
          itemCount: places.length,
          itemBuilder: (context, index) {
            final place = places[index];
            return SuggestionListTile(
              place: place,
              onTap: () => _onTap(context, ref, place),
            );
          },
        );
      },
    );
  }
}

class SuggetionMessageWidget extends StatelessWidget {
  const SuggetionMessageWidget(this.message, {super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: Sizes.p16),
        child: Text(message),
      ),
    );
  }
}
