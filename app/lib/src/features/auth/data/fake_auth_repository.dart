import 'package:app/src/core/exceptions/app_logger.dart';
import 'package:app/src/core/models/my_data_types.dart';
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

  String? _verifiedPhoneNumber;

  @override
  Stream<AppUser?> authStateChanges() => _authState.stream;

  @override
  Stream<AppUser?> idTokenChanges() => _authState.stream;

  @override
  Future<AppUser?> get currentUser async => _authState.value;

  @override
  Future<String> sendOtp(String phoneNumber) async {
    await delay(addDelay);
    const fakeOtp = '123456';
    _otpStorage[phoneNumber] = fakeOtp;
    AppLogger.logInfo('Sending OTP "$fakeOtp" to $phoneNumber');
    return phoneNumber;
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

    _otpStorage.remove(verificationId);
    _verifiedPhoneNumber = verificationId;
  }

  @override
  Future<AppUser?> getUserById(UserId userId) async {
    await delay(addDelay);
    try {
      return _users.firstWhere((user) => user.uid == userId);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> updateUserProfile({
    required String name,
    String? profilePicUrl,
    LatLng? location,
  }) async {
    await delay(addDelay);

    final phone = _verifiedPhoneNumber ?? _authState.value?.phoneNumber;
    if (phone == null) {
      throw Exception('No verified phone number');
    }

    final userData = _authState.value != null
        ? _authState.value!.copyWith(
            name: name,
            profileImageUrl: profilePicUrl,
            lastLocation: location,
          )
        : AppUser(
            uid: _uuid.v4(),
            phoneNumber: phone,
            name: name,
            profileImageUrl: profilePicUrl,
            lastLocation: location,
          );

    if (_authState.value == null) {
      _users.add(userData);
    } else {
      _updateUser(userData);
    }

    _authState.value = userData;
    _verifiedPhoneNumber = null;
  }

  @override
  Future<void> signOut() async {
    await delay(addDelay);
    _authState.value = null;
  }

  void dispose() => _authState.close();

  void _updateUser(AppUser updatedUser) {
    final index = _users.indexWhere((u) => u.uid == updatedUser.uid);
    if (index != -1) {
      _users[index] = updatedUser;
    }
  }
}
