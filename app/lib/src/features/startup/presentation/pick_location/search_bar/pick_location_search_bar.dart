import 'package:app/src/features/startup/domain/geolocation.dart';
import 'package:app/src/features/startup/presentation/pick_location/controllers/location_search_query_notifier.dart';
import 'package:app/src/features/startup/presentation/pick_location/controllers/search_focus_notifier.dart';
import 'package:app/src/features/startup/presentation/pick_location/search_bar/search_suggestion_listview.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PickLocationSearchBar extends ConsumerStatefulWidget {
  final Future<void> Function(GeoLocation) onTapSuggestion;
  const PickLocationSearchBar({super.key, required this.onTapSuggestion});

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
    if (!mounted) return;
    final focusNotifier = ref.read(searchFocusNotifierProvider);
    if (focusNotifier != isFocused) {
      ref.read(searchFocusNotifierProvider.notifier).setFocus(isFocused);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchAnchor.bar(
      isFullScreen: true,
      searchController: _controller,
      barHintText: context.loc.searchLocation,
      viewHintText: context.loc.enterCityName,
      barLeading: BackButton(onPressed: _goBack),
      viewLeading: BackButton(onPressed: _goBack),
      viewTrailing: [
        IconButton(onPressed: _clearQuery, icon: const Icon(Icons.clear)),
      ],
      onTap: () {
        _updateFocus(true);
        // debugPrint('Called------------------${_controller.text}');
        // ref
        //     .read(locationSearchQueryNotifierProvider.notifier)
        //     .setQuery(_controller.text);
      },
      onSubmitted: (_) => _updateFocus(false),
      onChanged: (query) {
        ref.read(locationSearchQueryNotifierProvider.notifier).setQuery(query);
        _updateFocus(true);
      },
      suggestionsBuilder: (context, controller) => [
        SearchSuggestionListView(onTapSuggestion: widget.onTapSuggestion),
      ],
    );
  }
}
