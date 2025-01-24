import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/startup/domain/place_dto.dart';
import 'package:app/src/features/startup/presentation/location_controller.dart';
import 'package:app/src/features/startup/presentation/pick_location/controllers/location_search_query_notifier.dart';
import 'package:app/src/features/startup/presentation/pick_location/controllers/search_focus_notifier.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PickLocationSearchBar extends ConsumerStatefulWidget {
  const PickLocationSearchBar({super.key});

  @override
  ConsumerState<PickLocationSearchBar> createState() =>
      _PickLocationSearchBarState();
}

class _PickLocationSearchBarState extends ConsumerState<PickLocationSearchBar> {
  final _controller = SearchController();

  void _clearQuery() {
    _controller.clear();
    ref.read(locationSearchQueryNotifierProvider.notifier).setQuery('');
  }

  void _goBack() {
    _updateFocus(false);
    context.pop();
  }

  void _updateFocus(bool isFocused) {
    final focusNotifier = ref.read(searchFocusNotifierProvider);
    if (focusNotifier != isFocused) {
      ref.read(searchFocusNotifierProvider.notifier).setFocus(isFocused);
    }
  }

  @override
  void dispose() {
    _updateFocus(false);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchAnchor.bar(
      isFullScreen: true,
      searchController: _controller,
      barHintText: 'Search Location'.hardcoded,
      viewHintText: 'Enter city name'.hardcoded,
      barLeading: BackButton(onPressed: _goBack),
      viewLeading: BackButton(onPressed: _goBack),
      viewTrailing: [
        IconButton(onPressed: _clearQuery, icon: const Icon(Icons.clear)),
      ],
      onTap: () => _updateFocus(true),
      onSubmitted: (_) => _updateFocus(false),
      onChanged: (query) {
        ref.read(locationSearchQueryNotifierProvider.notifier).setQuery(query);
        _updateFocus(true);
      },
      suggestionsBuilder: (context, controller) => [SearchSuggestionListView()],
    );
  }
}

class SearchSuggestionListView extends StatelessWidget {
  const SearchSuggestionListView({super.key});

  void _updateFocus(bool isFocused, WidgetRef ref) {
    final focusNotifier = ref.read(searchFocusNotifierProvider);
    if (focusNotifier != isFocused) {
      ref.read(searchFocusNotifierProvider.notifier).setFocus(isFocused);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final searchResults = ref.watch(locationSearchResultsProvider);

        if (searchResults.error != null) {
          return _buildMessage('Error: ${searchResults.error}');
        }

        final places = searchResults.value;
        if (places == null || places.isEmpty) {
          return _buildMessage('No results found');
        }

        return ListView.builder(
          shrinkWrap: true,
          itemCount: places.length,
          itemBuilder: (context, index) {
            final place = places[index];
            return SuggestionListTile(
              place: place,
              onTap: () async {
                final res = await ref
                    .read(locationControllerProvider.notifier)
                    .fetchPlaceDetails(place);
                debugPrint(res.toString());
                if (context.mounted) {
                  context.pop();
                  _updateFocus(false, ref);
                }
              },
            );
          },
        );
      },
    );
  }

  Center _buildMessage(String message) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: Sizes.p16),
        child: Text(message),
      ),
    );
  }
}

class SuggestionListTile extends StatelessWidget {
  const SuggestionListTile({
    super.key,
    required this.place,
    required this.onTap,
  });

  final PlaceSuggestion place;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
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
      onTap: onTap,
    );
  }
}
