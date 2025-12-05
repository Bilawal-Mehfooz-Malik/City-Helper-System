// import 'dart:convert';

// import 'package:app/src/features/pick_location/data/real/user_location_repository.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:mocktail/mocktail.dart';

// import '../../../../mocks.dart';

// void main() {
//   group('UserLocationRepository', () {
//     late MockSharedPreferences mockSharedPreferences;
//     late UserLocationRepositoryBeta userLocationRepository;

//     setUp(() {
//       mockSharedPreferences = MockSharedPreferences();
//       userLocationRepository = UserLocationRepositoryBeta(
//         mockSharedPreferences,
//       );
//     });

//     test('setUserLocation saves LatLng to SharedPreferences', () async {
//       const latLng = LatLng(34.0522, -118.2437);
//       when(
//         () => mockSharedPreferences.setString(
//           UserLocationRepositoryBeta.userLocationKey,
//           json.encode(latLng.toJson()),
//         ),
//       ).thenAnswer((_) async => true);

//       await userLocationRepository.setUserLocation(latLng);

//       verify(
//         () => mockSharedPreferences.setString(
//           UserLocationRepositoryBeta.userLocationKey,
//           json.encode(latLng.toJson()),
//         ),
//       ).called(1);
//     });

//     test('fetchUserLocation returns LatLng if data exists', () async {
//       const latLng = LatLng(34.0522, -118.2437);
//       when(
//         () => mockSharedPreferences.getString(
//           UserLocationRepositoryBeta.userLocationKey,
//         ),
//       ).thenAnswer((_) => json.encode(latLng.toJson()));

//       final result = await userLocationRepository.fetchUserLocation();

//       expect(result, latLng);
//       verify(
//         () => mockSharedPreferences.getString(
//           UserLocationRepositoryBeta.userLocationKey,
//         ),
//       ).called(1);
//     });

//     test('fetchUserLocation returns null if no data exists', () async {
//       when(
//         () => mockSharedPreferences.getString(
//           UserLocationRepositoryBeta.userLocationKey,
//         ),
//       ).thenAnswer((_) => null);

//       final result = await userLocationRepository.fetchUserLocation();

//       expect(result, isNull);
//       verify(
//         () => mockSharedPreferences.getString(
//           UserLocationRepositoryBeta.userLocationKey,
//         ),
//       ).called(1);
//     });
//   });
// }
