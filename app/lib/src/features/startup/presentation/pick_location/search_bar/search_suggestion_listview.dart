import 'package:app/src/core/exceptions/app_exceptions.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/startup/domain/geolocation.dart';
import 'package:app/src/features/startup/presentation/pick_location/controllers/location_search_query_notifier.dart';
import 'package:app/src/features/startup/presentation/pick_location/search_bar/suggestion_list_tile.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app/src/core/constants/app_sizes.dart';

class SearchSuggestionListView extends StatelessWidget {
  final Future<void> Function(GeoLocation) onTapSuggestion;

  const SearchSuggestionListView({super.key, required this.onTapSuggestion});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final searchResultsValue = ref.watch(locationSearchResultsProvider);

        // Handle errors
        if (searchResultsValue.error != null) {
          final error = searchResultsValue.error;
          final errorMessage =
              error is AppException
                  ? error.message
                  : '${context.loc.error}: $error';
          return SuggetionMessageWidget(errorMessage, isError: true);
        }

        // Handle empty or null results
        final places = searchResultsValue.value;
        if (places == null || places.isEmpty) {
          // TODO: implement previous search results
          return SuggetionMessageWidget(context.loc.noResultFound);
        }

        // Render search suggestions
        return ListView.builder(
          shrinkWrap: true,
          itemCount: places.length,
          itemBuilder: (context, index) {
            final place = places[index];
            return SuggestionListTile(
              place: place,
              onTapSuggestion: onTapSuggestion,
            );
          },
        );
      },
    );
  }
}

class SuggetionMessageWidget extends StatelessWidget {
  final bool isError;
  const SuggetionMessageWidget(this.message, {super.key, this.isError = false});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: Sizes.p32),
        child: Text(
          message,
          style: context.textTheme.labelMedium!.copyWith(
            color: isError ? context.colorScheme.error : null,
          ),
        ),
      ),
    );
  }
}
