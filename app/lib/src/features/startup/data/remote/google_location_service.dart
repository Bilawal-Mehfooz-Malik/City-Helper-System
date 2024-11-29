// import 'package:app/src/features/startup/domain/geo_location.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'location_service.g.dart';

// class LocationService {
//   // [Get User Location Using GeoLocator]
//   Future<GeoLocation?> getCurrentLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     // Check if location services are enabled
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     // Location services are not enabled, show setting service dialog to the user
//     if (!serviceEnabled) {
//       throw Exception('Location-Services-Not-Enabled');
//     }

//     // Check and request location permissions
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       // Permissions are denied, go to Decision Screen
//       if (permission == LocationPermission.denied) {
//         throw Exception('Permission-Denied-Go-To-Decision-Screen');
//       }
//     }

//     // Permissions are denied forever, show setting dialog to the user
//     if (permission == LocationPermission.deniedForever) {
//       throw Exception('Permission-Denied-Forever');
//     }

//     // If permissions are granted, get the current location
//     final res = await Geolocator.getCurrentPosition();
//     return GeoLocation(latitude: res.latitude, longitude: res.longitude);
//   }

//   Future<GeoLocation?> getLocationFromMap() async {}
// }

// @riverpod
// LocationService locationService(Ref locationService) {
//   return LocationService();
// }
// // // Helper method to show a dialog to enable location services
// //   Future<void> _showEnableLocationServicesDialog(BuildContext context) async {
// //     final local = AppLocalizations.of(context)!;

// //     return showDialog<void>(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           title: Text(local.enLocServTitle),
// //           content: Text(local.enLocServContent),
// //           actions: <Widget>[
// //             TextButton(
// //               child: Text(local.openSettings),
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //                 Geolocator.openLocationSettings();
// //               },
// //             ),
// //             TextButton(
// //               child: Text(local.cancel),
// //               onPressed: () => context.pop(),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   // [Showing Dialog to go to Settings if permission are parmanently disabled]
// //   Future<void> _showSettingsDialog(BuildContext context) async {
// //     final local = AppLocalizations.of(context)!;
// //     twoButtonDialog(
// //         context: context,
// //         title: local.permissionDeniedTitle,
// //         content: local.permissionDeniedContent,
// //         leftButtonText: local.cancel,
// //         rightButtonText: local.openSettings,

// //         // [cancel Button]
// //         leftButtonAction: () {
// //           context.pop();
// //           _navigateToDecisionScreen(context);
// //         },

// //         // [Settings Button]
// //         rightButtonAction: () {
// //           context.pop();
// //           Geolocator.openAppSettings();
// //         });
// //   }

// //   void _navigateToDecisionScreen(BuildContext context) {
// //     context.goNamed(AppRoutes.decision.name);
// //   }
// // }
// //