import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'account_action_controller.g.dart';

enum AccountAction { none, logout, delete }

@riverpod
class AccountActionController extends _$AccountActionController {
  @override
  AccountAction build() {
    return AccountAction.none;
  }

  void setAction(AccountAction action) {
    state = action;
  }
}
