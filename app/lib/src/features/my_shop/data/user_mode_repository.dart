import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_mode_repository.g.dart';

// This repository handles the saving and loading of the user's mode.
class UserModeRepository {
  UserModeRepository(this.prefs);
  final SharedPreferences prefs;

  static const _isAdminModeKey = 'isAdminMode';

  bool getIsAdminMode() => prefs.getBool(_isAdminModeKey) ?? false;

  Future<void> setIsAdminMode(bool isAdmin) =>
      prefs.setBool(_isAdminModeKey, isAdmin);
}

// A simple provider to expose the repository.
@riverpod
UserModeRepository userModeRepository(Ref ref) {
  // This will be overridden in main.dart once SharedPreferences is initialized.
  throw UnimplementedError();
}
