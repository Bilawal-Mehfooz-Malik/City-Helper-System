import 'package:app/src/core/utils/default_location_provider.dart';
import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/features/startup/presentation/controllers/location_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  Future<void> build() async {}

  Future<AsyncValue<void>> sendOtp(String phoneNumber) async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncLoading();
    final result = await AsyncValue.guard(
      () => authRepository.sendOtp(phoneNumber),
    );
    state = result;
    return result;
  }

  Future<AsyncValue<void>> verifyOtp({
    required String code,
    required String verificationId,
  }) async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncLoading();

    final result = await AsyncValue.guard(
      () => authRepository.verifyOtp(
        smsCode: code,
        verificationId: verificationId,
      ),
    );

    state = result;
    return result;
  }

  Future<AsyncValue<void>> completeSignup({
    required String name,
    String? profilePicUrl,
  }) async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncLoading();
    // Get the current location from the location controller
    final location = ref.read(locationControllerProvider).value;
    final defaultLocation = ref.read(defaultLocationProvider);

    final result = await AsyncValue.guard(() async {
      await authRepository.updateUserProfile(
        name: name,
        profilePicUrl: profilePicUrl,
      );
      await authRepository.updateUserLocation(location ?? defaultLocation);
    });

    state = result;
    return result;
  }

  Future<AsyncValue<void>> updateProfile({
    required String name,
    String? profilePicUrl,
  }) async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncLoading();

    final location = ref.read(locationControllerProvider).value;
    final defaultLocation = ref.read(defaultLocationProvider);

    final result = await AsyncValue.guard(() async {
      await authRepository.editUserProfile(
        name: name,
        profilePicUrl: profilePicUrl,
      );
      await authRepository.updateUserLocation(location ?? defaultLocation);
    });

    state = result;
    return result;
  }
}
