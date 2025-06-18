import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'phone_number_controller.g.dart';

@Riverpod(keepAlive: true)
class PhoneNumberController extends _$PhoneNumberController {
  @override
  String build() => '';

  void setNumber(String number) {
    state = number;
  }

  void clear() => state = '';
}
