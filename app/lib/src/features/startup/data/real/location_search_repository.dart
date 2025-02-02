import 'dart:async';

import 'package:app/env.dart';
import 'package:app/src/core/exceptions/dio_safe_api_call.dart';
import 'package:app/src/core/models/place.dart';
import 'package:app/src/core/exceptions/app_logger.dart';
import 'package:app/src/core/exceptions/dio_intercepter.dart';
import 'package:app/src/features/startup/domain/geolocation.dart';
import 'package:app/src/features/startup/domain/place_dto.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
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

    // * Performing Post Request
    return dioSafeApiCall(() async {
      final response = await _dio.post<Map<String, Object?>>(url,
          options: options, data: data);

      // * Parsing Data into [PlaceSuggestion] and returning List<PlaceSuggestion>
      final suggestions = response.data?['suggestions'] as List<Object?>? ?? [];

      return suggestions
          .cast<Map<String, Object?>>()
          .map((json) => PlaceSuggestion.fromJson(json))
          .toList();
    });
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

  final link = ref.keepAlive();
  Timer? timer;

  ref.onDispose(() => timer?.cancel());

  final bool isTestMode = !kReleaseMode && !kProfileMode;
  final timerDuration =
      isTestMode ? Duration.zero : const Duration(seconds: 30);

  ref.onCancel(() {
    // Immediately close in test mode rather than scheduling a timer.
    if (isTestMode) {
      link.close();
    } else {
      timer = Timer(timerDuration, () => link.close());
    }
  });

  ref.onResume(() => timer?.cancel());

  try {
    final searchRepository = ref.watch(locationSearchRepositoryProvider);
    final results = await searchRepository.fetchSuggestions(query);
    return results;
  } catch (e, s) {
    AppLogger.logError(
      'Error fetching suggestions for query: $query'.hardcoded,
      error: e,
      stackTrace: s,
    );
    link.close();
    rethrow;
  }
}
