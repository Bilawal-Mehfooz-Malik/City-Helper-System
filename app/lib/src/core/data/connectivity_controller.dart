// import 'dart:async';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'connectivity_repository.dart';

// part 'connectivity_controller.g.dart';

// @riverpod
// class ConnectivityController extends _$ConnectivityController {
//   late final StreamSubscription<bool> _subscription;

//   @override
//   bool build() {
//     final connectivityRepository = ref.read(connectivityRepositoryProvider);

//     connectivityRepository.hasInternetConnection().then((isConnected) {
//       state = isConnected;
//     });

//     _subscription = connectivityRepository.onInternetStatusChanged().listen((
//       isConnected,
//     ) {
//       state = isConnected;
//     });

//     ref.onDispose(() {
//       _subscription.cancel();
//     });

//     return false;
//   }
// }
