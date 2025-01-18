// import 'dart:async';

// import 'package:app/env.dart';
// import 'package:app/src/core/models/location.dart';
// import 'package:app/src/features/startup/domain/user_location.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'location_search_repository.g.dart';

// class LocationSearchRepository {
//   LocationSearchRepository(this._dio);

//   final Dio _dio;

//   Future<List<Location>?> performTextSearch(String query) async {
//     const url = 'https://places.googleapis.com/v1/places:searchText';
//     try {
//       final response = await _dio.post(url,
//           options: Options(
//             headers: {
//               'Content-Type': 'application/json',
//               'X-Goog-Api-Key': Env.googleMapsKey,
//               'X-Goog-FieldMask':
//                   'places.id,places.displayName,places.formattedAddress,places.location',
//             },
//           ),
//           data: {"textQuery": query});

//       if (response.statusCode == 200) {
//         // debugPrint('Raw API Response: ${response.data}');
//         final List<dynamic> places = response.data['places'];

//         return places.map((place) {
//           final locJson = place['location'];
//           return Location(
//             id: place['id'],
//             name: place['displayName']['text'],
//             streetAddress: place['formattedAddress'],
//             geoLocation: UserLocation.fromJson(locJson),
//           );
//         }).toList();
//       } else {
//         debugPrint(
//             'API Error: ${response.statusCode} - ${response.statusMessage}');
//       }
//     } catch (e) {
//       debugPrint('Request failed: $e');
//     }

//     return null;
//   }

//   // Future<List<dynamic>?> fetchAutocompleteSuggestions(String query) async {
//   //   const url = 'https://places.googleapis.com/v1/places:autocomplete';

//   //   final response = await Dio().post(
//   //     url,
//   //     options: Options(headers: {
//   //       'Content-Type': 'application/json',
//   //       'X-Goog-Api-Key': Env.googleMapsKey,
//   //     }),
//   //     data: {
//   //       "input": query,
//   //       "locationBias": {
//   //         "circle": {
//   //           "center": {"latitude": 33.1401, "longitude": 73.7490},
//   //           "radius": 5000.0
//   //         }
//   //       }
//   //     },
//   //   );

//   //   return response.data['predictions'];
//   // }
// }

// @riverpod
// LocationSearchRepository locationSearchRepository(Ref ref) {
//   return LocationSearchRepository(Dio());
// }

// @riverpod
// Future<List<Location>?> locationListSearch(Ref ref, String query) async {
//   final link = ref.keepAlive();
//   // a timer to be used by the callbacks below
//   Timer? timer;
//   // When the provider is destroyed, cancel the timer
//   ref.onDispose(() {
//     timer?.cancel();
//   });
//   // When the last listener is removed, start a timer to dispose the cached data
//   ref.onCancel(() {
//     // start a 30 second timer
//     timer = Timer(const Duration(seconds: 30), () {
//       // dispose on timeout
//       link.close();
//     });
//   });
//   // If the provider is listened again after it was paused, cancel the timer
//   ref.onResume(() {
//     timer?.cancel();
//   });

//   if (query.isEmpty) {
//     return [];
//   }

//   final searchRepository = ref.watch(locationSearchRepositoryProvider);
//   return searchRepository.performTextSearch(query);
// }
