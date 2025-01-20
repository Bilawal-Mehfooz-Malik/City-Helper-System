import 'dart:async';

import 'package:app/env.dart';
import 'package:app/src/core/models/place.dart';
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

  Future<List<Place>> fetchSuggestions(String query) async {
    const url = 'https://places.googleapis.com/v1/places:autocomplete';

    try {
      // Performing Post Request
      final response = await _dio.post<Map<String, dynamic>>(
        url,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'X-Goog-Api-Key': Env.googleMapsKey,
        }),
        data: {
          "input": query,
          "locationBias": {
            "circle": {
              "center": {"latitude": 33.1401, "longitude": 73.7490},
              "radius": 5000.0,
            }
          },
        },
      );

      final suggestions = response.data?['suggestions'] as List<dynamic>?;
      if (suggestions == null || suggestions.isEmpty) {
        return [];
      }

      // Converting List<dynamic> into List<Place>
      final list = suggestions.cast<Map<String, dynamic>>().map<Place>((json) {
        final id = json['placePrediction']['placeId'] as String;
        final name = json['placePrediction']['structuredFormat']['mainText']
            ['text'] as String;
        final address = json['placePrediction']['structuredFormat']
            ['secondaryText']?['text'] as String?;

        return Place(id: id, name: name, streetAddress: address);
      }).toList();
      return list;
    } catch (e, s) {
      debugPrint('Unexpected error: $e StackTrace: $s');
      rethrow;
    }
  }

  // Future<Place?> fetchPlaceDetails(Place place) async {
  //   const String baseUrl = 'https://places.googleapis.com/v1/places/';
  //   final String url = '$baseUrl${place.id}';

  //   try {
  //     final response = await _dio.get(
  //       url,
  //       options: Options(
  //         headers: {
  //           'Content-Type': 'application/json',
  //           'X-Goog-Api-Key': Env.googleMapsKey,
  //           'X-Goog-FieldMask': 'id,displayName,formattedAddress,location',
  //         },
  //       ),
  //     );

  //     // Parsing the response data into a Place object.
  //     debugPrint(response.data);
  //     final locationData = response.data['location'];
  //     if (locationData != null) {
  //       final geoLocation = GeoLocation.fromJson(locationData);
  //       final newPlace = place.copyWith(geoLocation: geoLocation);
  //       debugPrint(newPlace.toString());
  //       return newPlace;
  //     } else {
  //       throw Exception('Location data not found in the response');
  //     }
  //   } catch (e) {
  //     throw Exception('Failed to fetch place details: $e');
  //   }
  // }
}

@riverpod
LocationSearchRepository locationSearchRepository(Ref ref) {
  return LocationSearchRepository(Dio());
}

@riverpod
Future<List<Place>?> locationListSearch(Ref ref, String query) async {
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
