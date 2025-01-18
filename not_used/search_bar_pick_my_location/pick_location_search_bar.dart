// import 'package:app/src/features/startup/data/location_search_repository.dart';
// import 'package:app/src/features/startup/presentation/pick_location/location_search_query_notifier.dart';
// import 'package:app/src/localization/string_hardcoded.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class PickLocationSearchBar extends ConsumerStatefulWidget {
//   const PickLocationSearchBar({super.key});

//   @override
//   ConsumerState<PickLocationSearchBar> createState() =>
//       _PickLocationSearchBarState();
// }

// class _PickLocationSearchBarState extends ConsumerState<PickLocationSearchBar> {
//   final _controller = SearchController();

//   void _clearQuery() {
//     _controller.clear();
//     ref.read(locationSearchQueryNotifierProvider.notifier).setQuery('');
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SearchAnchor.bar(
//       barLeading: const BackButton(),
//       barHintText: 'Search Location'.hardcoded,
//       searchController: _controller,
//       viewHintText: 'Enter city name'.hardcoded,
//       viewTrailing: [
//         IconButton(onPressed: _clearQuery, icon: Icon(Icons.clear))
//       ],
//       // onChanged: (query) => ref.read(locationListSearchProvider(query)),
//       onChanged: (query) => ref
//           .read(locationSearchQueryNotifierProvider.notifier)
//           .setQuery(query),
//       suggestionsBuilder: (context, controller) {
//         final searchResultsValue = ref.watch(locationSearchResultsProvider);

//         final error = searchResultsValue.error;
//         if (error != null) {
//           return [Center(child: Text('error :$error.'))];
//         }
//         final locations = searchResultsValue.value;
//         if (locations == null) {
//           return [
//             const Center(child: CircularProgressIndicator()),
//           ];
//         }

//         return locations.map(
//           (location) {
//             debugPrint(location.toString());
//             return ListTile(
//               title: Text(location.name),
//               subtitle: Text(location.streetAddress),
//               onTap: () {},
//             );
//           },
//         );
//       },
//     );
//   }
// }
