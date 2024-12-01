import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../routers/app_router.dart';

part 'user_location_controller.g.dart';

@riverpod
class UserLocationController extends _$UserLocationController {
  @override
  FutureOr<LatLng?> build() {
    return null;
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    state = const AsyncLoading();

    try {
      // Check if location services are enabled
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      // Location services are not enabled, show setting service dialog to the user
      if (!serviceEnabled) {
        state = AsyncError('Location-Services-Not-Enabled', StackTrace.current);
        return;
      }

      // Check and request location permissions
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        // Permissions are denied, go to Decision Screen
        if (permission == LocationPermission.denied) {
          ref.read(appRouterProvider).goNamed(AppRoute.permissionDenied.name);
          return;
        }

        // Permissions are denied forever, show setting dialog to the user
        if (permission == LocationPermission.deniedForever) {
          state = AsyncError('Permission-Denied-Forever', StackTrace.current);

          return;
        }

        // If permissions are granted, get the current location
        final res = await Geolocator.getCurrentPosition();
        state = AsyncData(LatLng(res.latitude, res.longitude));
      }
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  void getLocationFromMap(LatLng latLng) {
    state = const AsyncLoading();
    state = AsyncData(latLng);
  }
}

// // [Showing Dialog to go to Settings if permission are parmanently disabled]
// Future<void> _showSettingsDialog(BuildContext context) async {
//   final local = AppLocalizations.of(context)!;
//   twoButtonDialog(
//       context: context,
//       title: local.permissionDeniedTitle,
//       content: local.permissionDeniedContent,
//       leftButtonText: local.cancel,
//       rightButtonText: local.openSettings,

//       // [cancel Button]
//       leftButtonAction: () {
//         context.pop();
//         _navigateToDecisionScreen(context);
//       },

//       // [Settings Button]
//       rightButtonAction: () {
//         context.pop();
//         Geolocator.openAppSettings();
//       });
// }
