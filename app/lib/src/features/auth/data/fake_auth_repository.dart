import 'package:app/src/core/exceptions/app_logger.dart';
import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/core/utils/in_memory_store.dart';
import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/features/auth/domain/app_user.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';

class FakeAuthRepository implements AuthRepository {
  final bool addDelay;
  FakeAuthRepository({this.addDelay = true});

  final _authState = InMemoryStore<AppUser?>(null);
  final _users = <AppUser>[];
  final _otpStorage = <String, String>{};
  final _uuid = const Uuid();

  // --- Public API ---

  @override
  Stream<AppUser?> authStateChanges() => _authState.stream;

  @override
  Stream<AppUser?> idTokenChanges() => _authState.stream;

  @override
  AppUser? get currentUser => _authState.value;

  @override
  Future<void> sendOtp(String phoneNumber) async {
    await delay(addDelay);

    const fakeOtp = '123456'; // Using static OTP for testing
    _otpStorage[phoneNumber] = fakeOtp;

    AppLogger.logInfo('Sending OTP "$fakeOtp" to $phoneNumber');
  }

  @override
  Future<void> verifyOtp({
    required String verificationId,
    required String smsCode,
  }) async {
    await delay(addDelay);

    final storedOtp = _otpStorage[verificationId];
    if (storedOtp == null) {
      throw Exception('No OTP sent to this number');
    }
    if (storedOtp != smsCode) {
      throw Exception('Invalid OTP');
    }

    // Check if user already exists or create new
    var user = _users.firstWhere(
      (u) => u.phoneNumber == verificationId,
      orElse: () => AppUser(
        uid: _uuid.v4(),
        phoneNumber: verificationId,
        name: null,
        profileImageUrl: null,
        lastLocation: null,
      ),
    );

    if (!_users.contains(user)) {
      _users.add(user);
    }

    _authState.value = user;
  }

  @override
  Future<void> updateUserLocation(LatLng location) async {
    await delay(addDelay);
    final user = _requireSignedInUser();
    final updatedUser = user.copyWith(lastLocation: location);

    _updateUser(updatedUser);
  }

  @override
  Future<void> updateUserProfile({
    required String name,
    String? profilePicUrl,
  }) async {
    await delay(addDelay);

    final user = _requireSignedInUser();
    final updatedUser = user.copyWith(
      name: name,
      profileImageUrl: profilePicUrl,
    );

    _updateUser(updatedUser);
  }

  @override
  Future<void> signOut() async {
    await delay(addDelay);
    _authState.value = null;
  }

  void dispose() => _authState.close();

  // --- Internal Helpers ---

  AppUser _requireSignedInUser() {
    final user = _authState.value;
    if (user == null) throw Exception('No user signed in');
    return user;
  }

  void _updateUser(AppUser updatedUser) {
    final index = _users.indexWhere((u) => u.uid == updatedUser.uid);
    if (index != -1) {
      _users[index] = updatedUser;
    }
    _authState.value = updatedUser;
  }
}
