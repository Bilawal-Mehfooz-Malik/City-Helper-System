import 'package:app/src/core/exceptions/app_logger.dart';
import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/core/utils/in_memory_store.dart';
import 'package:app/src/features/auth/domain/app_user.dart';
import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:uuid/uuid.dart';

class FakeAuthRepository implements AuthRepository {
  FakeAuthRepository({this.addDelay = true});

  final _authState = InMemoryStore<AppUser?>(null);
  final _otpStorage = <String, String>{};
  final _uuid = const Uuid();
  final List<AppUser> _users = [];
  String? _verifiedPhoneNumber;
  final bool addDelay;

  @override
  Future<String> sendOtp(String phoneNumber) async {
    await delay(addDelay);
    const otp = '123456';
    _otpStorage[phoneNumber] = otp;
    AppLogger.logInfo('FakeAuth: Sent OTP "$otp" to $phoneNumber');
    return phoneNumber;
  }

  @override
  Future<void> verifyOtp({
    required String verificationId,
    required String smsCode,
  }) async {
    await delay(addDelay);
    final storedOtp = _otpStorage[verificationId];
    if (storedOtp == null || storedOtp != smsCode) {
      throw Exception('Invalid OTP');
    }
    _verifiedPhoneNumber = verificationId;
    _otpStorage.remove(verificationId);
  }

  Future<void> signInWithVerifiedPhone({required String name}) async {
    if (_verifiedPhoneNumber == null) {
      throw Exception('Phone number not verified.');
    }

    final user = _users.firstWhere(
      (u) => u.phoneNumber == _verifiedPhoneNumber,
      orElse: () => AppUser(
        uid: _uuid.v4(),
        phoneNumber: _verifiedPhoneNumber!,
        name: name,
      ),
    );

    if (!_users.contains(user)) _users.add(user);
    _authState.value = user;
    _verifiedPhoneNumber = null;
  }

  @override
  AppUser? get currentUser => _authState.value;

  @override
  Stream<AppUser?> authStateChanges() => _authState.stream;

  @override
  Stream<AppUser?> idTokenChanges() => _authState.stream;

  @override
  Future<void> signOut() async {
    _authState.value = null;
  }

  void dispose() => _authState.close();
}
