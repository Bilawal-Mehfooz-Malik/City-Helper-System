import 'dart:async';
import 'package:app/src/core/exceptions/app_exceptions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'connectivity_repository.dart';

part 'connectivity_controller.g.dart';

@riverpod
class ConnectivityController extends _$ConnectivityController {
  late final StreamSubscription<bool> _subscription;

  @override
  bool build() {
    /// Getting [ConnectivityRepository] instance.
    final connectivityRepository = ref.read(connectivityRepositoryProvider);
    // initializing the state with the current connection status.
    connectivityRepository.hasInternetConnection().then((isConnected) {
      state = isConnected;
    });
    // Listen for real-time connectivity changes.
    _subscription =
        connectivityRepository.onInternetStatusChanged().listen((isConnected) {
      state = isConnected;
    });
    // Return a default value.
    throw NoInternetConnectionException();
  }

  void dispose() {
    _subscription.cancel();
  }
}
