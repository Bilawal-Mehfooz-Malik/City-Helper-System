// import 'package:app/src/features/startup/data/fake_user_repository.dart';
// import 'package:app/src/features/startup/domain/geo_location.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   final testUserLocation = GeoLocation(latitude: 123, longitude: 123);

//   FakeLocationRepository makeLocationRepository() {
//     return FakeLocationRepository(addDelay: false);
//   }

//   group('FakeLocationRepository', () {
//     test('First time userLocation is null', () {
//       final locationRepostory = makeLocationRepository();
//       expect(locationRepostory.userLocation, null);
//       expect(locationRepostory.userLocationState(), emits(null));
//     });

//     test('user Location is not null after getCurrentLocation called', () async {
//       final locationRepostory = makeLocationRepository();
//       await locationRepostory.getCurrentLocation();
//       expect(locationRepostory.userLocation, testUserLocation);
//       expect(locationRepostory.userLocationState(), emits(testUserLocation));
//     });

//     test('user Location is not null after getLocationFromMap called', () async {
//       final locationRepostory = makeLocationRepository();
//       await locationRepostory.getLocationFromMap();
//       expect(locationRepostory.userLocation, testUserLocation);
//       expect(locationRepostory.userLocationState(), emits(testUserLocation));
//     });
//   });
// }
