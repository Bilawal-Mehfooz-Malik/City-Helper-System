import 'dart:async';

import 'package:app/env.dart';
import 'package:app/src/core/exceptions/dio_safe_api_call.dart';
import 'package:app/src/core/models/place.dart';
import 'package:app/src/core/exceptions/app_logger.dart';
import 'package:app/src/core/exceptions/dio_intercepter.dart';
import 'package:app/src/features/startup/domain/geolocation.dart';
import 'package:app/src/features/startup/domain/location_exceptions.dart';
import 'package:app/src/features/startup/domain/place_dto.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_search_repository.g.dart';

class LocationSearchRepository {
  LocationSearchRepository(this._dio);

  final Dio _dio;

  Future<List<PlaceSuggestion>> fetchSuggestions(String query) {
    // setup
    const url = 'https://places.googleapis.com/v1/places:autocomplete';
    final options = Options(headers: {
      'Content-Type': 'application/json',
      'X-Goog-Api-Key': Env.googleMapsKey,
    });
    var data = {
      "input": query,
      "locationBias": {
        "circle": {
          "center": {"latitude": 33.1401, "longitude": 73.7490},
          "radius": 5000.0,
        },
      },
    };

    try {
      // * Performing Post Request
      return dioSafeApiCall(() async {
        final response = await _dio.post<Map<String, Object?>>(url,
            options: options, data: data);

        // * Parsing Data into [PlaceSuggestion] and returning List<PlaceSuggestion>
        final suggestions =
            response.data?['suggestions'] as List<Object?>? ?? [];
        return suggestions
            .cast<Map<String, Object?>>()
            .map((json) => PlaceSuggestion.fromJson(json))
            .toList();
      });
    } catch (e, s) {
      AppLogger.logError(
        'Error fetching suggestions for query: $query'.hardcoded,
        error: e,
        stackTrace: s,
      );
      throw SuggestionFetchFailedException();
    }
  }

  Future<Place> fetchPlaceDetails(PlaceSuggestion suggestion) {
    // setup
    const urlTemplate = 'https://places.googleapis.com/v1/places/';
    final url = '$urlTemplate${suggestion.id}';
    final options = Options(headers: {
      'Content-Type': 'application/json',
      'X-Goog-Api-Key': Env.googleMapsKey,
      'X-Goog-FieldMask': 'location,formattedAddress',
    });

    try {
      // * Performing the GET request
      return dioSafeApiCall(() async {
        final response =
            await _dio.get<Map<String, Object?>>(url, options: options);

        // * Parsing the response into PlaceDetailsResponse
        final details = PlaceDetails.fromJson(response.data ?? {});

        // * Returning Place Object
        return Place(
          id: suggestion.id,
          name: suggestion.name,
          streetAddress: details.streetAddress,
          geoLocation: GeoLocation(
            latitude: details.latitude,
            longitude: details.longitude,
          ),
        );
      });
    } catch (e, s) {
      AppLogger.logError(
        'Error fetching place details for suggestion: ${suggestion.id}'
            .hardcoded,
        error: e,
        stackTrace: s,
      );
      throw LocationFetchFailedException();
    }
  }
}

@riverpod
LocationSearchRepository locationSearchRepository(Ref ref) {
  final dio = Dio(
    BaseOptions(
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
    ),
  );

  dio.interceptors.add(CustomInterceptors());

  return LocationSearchRepository(dio);
}

@riverpod
Future<List<PlaceSuggestion>?> locationListSearch(Ref ref, String query) async {
  if (query.isEmpty) {
    return [];
  }

  // Create a keepAlive link for caching
  final link = ref.keepAlive();
  Timer? timer;

  // Handle disposal of timer
  ref.onDispose(() => timer?.cancel());

  // Start disposal timer when last listener is removed
  ref.onCancel(() {
    timer = Timer(const Duration(seconds: 30), () {
      link.close();
    });
  });

  // Cancel disposal timer if provider is listened to again
  ref.onResume(() => timer?.cancel());

  try {
    final searchRepository = ref.watch(locationSearchRepositoryProvider);
    final results = await searchRepository.fetchSuggestions(query);

    // Only cache successful results
    return results;
  } catch (e, s) {
    AppLogger.logError(
      'Error fetching suggestions for query: $query'.hardcoded,
      error: e,
      stackTrace: s,
    );
    // Invalidate the cache by closing the keepAlive link
    link.close();

    // Rethrow the error without caching it
    rethrow;
  }
}
