// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'connectivity_repository.g.dart';

// class ConnectivityRepository {
//   ConnectivityRepository(this.internetChecker);

//   final InternetConnection internetChecker;

//   // Check whether the device has an active internet connection
//   Future<bool> hasInternetConnection() async {
//     return internetChecker.hasInternetAccess;
//   }

//   // Stream to listen for real-time internet connection changes
//   Stream<bool> onInternetStatusChanged() {
//     return internetChecker.onStatusChange.map((status) {
//       return status == InternetStatus.connected;
//     });
//   }
// }

// @riverpod
// ConnectivityRepository connectivityRepository(Ref ref) {
//   return ConnectivityRepository(InternetConnection());
// }

// @Riverpod(keepAlive: true)
// Stream<bool> internetStatus(Ref ref) {
//   final connectivityRepository = ref.watch(connectivityRepositoryProvider);
//   return connectivityRepository.onInternetStatusChanged();
// }
