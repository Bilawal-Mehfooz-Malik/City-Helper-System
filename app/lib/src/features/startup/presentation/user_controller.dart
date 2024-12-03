import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utils/current_date_provider.dart';
import '../../../exceptions/app_exceptions.dart';
import '../../../routers/app_router.dart';
import '../domain/app_user.dart';
import '../domain/user_repository.dart';
import 'user_location_controller.dart';

part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {
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

    final currentDateTime = ref.read(currentDateProvider);

    final user =
        AppUser(userLocation: userLocation, lastUpdated: currentDateTime);
    final userRepository = ref.read(userRepositoryProvider);
    state = await AsyncValue.guard(() => userRepository.setUser(user));

    /// Navigate to [HomeScreen]
    if (state is AsyncData) {
      ref.read(appRouterProvider).goNamed(AppRoute.home.name);
    }
  }

  Future<void> fetchUser() async {
    state = const AsyncLoading();
    final userRepository = ref.read(userRepositoryProvider);
    state = await AsyncValue.guard(() => userRepository.fetchUser());
  }
}
