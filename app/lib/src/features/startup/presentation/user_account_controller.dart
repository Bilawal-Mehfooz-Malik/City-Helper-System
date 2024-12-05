import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../exceptions/app_exceptions.dart';
import '../../../routers/app_router.dart';
import '../domain/user_location_repository.dart';
import 'user_location_controller.dart';

part 'user_account_controller.g.dart';

@riverpod
class UserAccountController extends _$UserAccountController {
  @override
  FutureOr<void> build() {}

  Future<void> createUser() async {
    state = const AsyncLoading();
    final userLocationController = ref.read(userLocationControllerProvider);

    // Checking if the location is available; handle null case gracefully
    final userLocation = userLocationController.maybeWhen(
      data: (location) => location,
      orElse: () => null,
    );

    if (userLocation == null) {
      state = AsyncError(LocationNotPickedException(), StackTrace.current);
      return;
    }

    final repository = ref.read(userLocationRepositoryProvider);
    state =
        await AsyncValue.guard(() => repository.setUserLocation(userLocation));

    /// Navigate to [HomeScreen]
    if (state is AsyncData) {
      ref.read(appRouterProvider).goNamed(AppRoute.home.name);
    }
  }

  Future<void> fetchUser() async {
    state = const AsyncLoading();
    final userRepository = ref.read(userLocationRepositoryProvider);
    state = await AsyncValue.guard(() => userRepository.fetchUserLocation());
  }
}
