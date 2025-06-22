import 'package:app/src/core/utils/default_location_provider.dart';
import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/features/auth/domain/auth_exceptions.dart';
import 'package:app/src/features/auth/presentation/controllers/verification_id_controller.dart';
import 'package:app/src/features/startup/presentation/controllers/user_location_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  Future<void> build() async {}

  Future<AsyncValue<void>> sendOtp(String phoneNumber) async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncLoading();

    String? verificationId;
    final result = await AsyncValue.guard(() async {
      verificationId = await authRepository.sendOtp(phoneNumber);
    });

    if (!result.hasError && verificationId != null) {
      ref.read(verificationIdControllerProvider.notifier).set(verificationId);
    } else {
      ref.read(verificationIdControllerProvider.notifier).clear();
    }

    state = result;
    return result;
  }

  Future<AsyncValue<void>> verifyOtp({required String code}) async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncLoading();

    final verificationId = ref.read(verificationIdControllerProvider);
    if (verificationId == null) {
      state = AsyncError(VerificationIdMissingException(), StackTrace.current);
      return AsyncError(VerificationIdMissingException(), StackTrace.current);
    }

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
    final location = ref.read(userLocationControllerProvider).value;
    final defaultLocation = ref.read(defaultLocationProvider);

    final result = await AsyncValue.guard(() async {
      await authRepository.updateUserProfile(
        name: name,
        profilePicUrl: profilePicUrl,
        location: (location ?? defaultLocation),
      );
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

    final location = ref.read(userLocationControllerProvider).value;
    final defaultLocation = ref.read(defaultLocationProvider);

    final result = await AsyncValue.guard(() async {
      await authRepository.updateUserProfile(
        name: name,
        profilePicUrl: profilePicUrl,
        location: (location ?? defaultLocation),
      );
    });

    state = result;
    return result;
  }
}
