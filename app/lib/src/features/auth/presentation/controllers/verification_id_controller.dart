import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'verification_id_controller.g.dart';

@Riverpod(keepAlive: true)
class VerificationIdController extends _$VerificationIdController {
  @override
  String? build() {
    return null;
  }

  void set(String? verificationId) {
    state = verificationId;
  }

  void clear() {
    state = null;
  }
}
