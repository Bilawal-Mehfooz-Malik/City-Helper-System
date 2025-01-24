import 'dart:async';

import 'package:app/env.dart';
import 'package:app/src/core/models/place.dart';
import 'package:app/src/features/startup/domain/geolocation.dart';
import 'package:app/src/features/startup/domain/place_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_search_repository.g.dart';

class LocationSearchRepository {
  LocationSearchRepository(this._dio) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        debugPrint('Request: ${options.method} ${options.uri}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        debugPrint('Response: ${response.statusCode} ${response.data}');
        return handler.next(response);
      },
      onError: (error, handler) {
        debugPrint('Error: ${error.response?.statusCode} ${error.message}');
        return handler.next(error);
      },
    ));
  }

  final Dio _dio;

  Future<List<PlaceSuggestion>> fetchSuggestions(String query) async {
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
      final response = await _dio.post<Map<String, Object?>>(url,
          options: options, data: data);

      // * Parsing Data into [PlaceSuggestion] and returning List<PlaceSuggestion>
      final suggestions = response.data?['suggestions'] as List<Object?>? ?? [];
      return suggestions
          .cast<Map<String, Object?>>()
          .map((json) => PlaceSuggestion.fromJson(json))
          .toList();
    } catch (e, s) {
      debugPrint('Unexpected error: $e StackTrace: $s');
      rethrow;
    }
  }

  Future<Place> fetchPlaceDetails(PlaceSuggestion suggestion) async {
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
    } catch (e, s) {
      debugPrint('Error updating place geolocation: $e, StackTrace: $s');
      rethrow;
    }
  }
}

@riverpod
LocationSearchRepository locationSearchRepository(Ref ref) {
  return LocationSearchRepository(Dio());
}

@riverpod
Future<List<PlaceSuggestion>?> locationListSearch(Ref ref, String query) async {
  final link = ref.keepAlive();
  // a timer to be used by the callbacks below
  Timer? timer;
  // When the provider is destroyed, cancel the timer
  ref.onDispose(() => timer?.cancel());
  // When the last listener is removed, start a timer to dispose the cached data
  ref.onCancel(() => timer = Timer(const Duration(seconds: 30), () {
        // dispose on timeout
        link.close();
      }));
  // If the provider is listened again after it was paused, cancel the timer
  ref.onResume(() => timer?.cancel());

  if (query.isNotEmpty) {
    final searchRepository = ref.watch(locationSearchRepositoryProvider);
    return searchRepository.fetchSuggestions(query);
  }

  return [];
}
