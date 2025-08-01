import 'package:app/src/features/my_shop/data/user_mode_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_mode_controller.g.dart';

// It holds the current mode and handles saving it.
@riverpod
class UserModeController extends _$UserModeController {
  @override
  bool build() {
    // Load the initial state from the repository.
    return ref.watch(userModeRepositoryProvider).getIsAdminMode();
  }

  // Toggles the mode and saves the new state to SharedPreferences.
  Future<void> toggleMode() async {
    final repository = ref.read(userModeRepositoryProvider);
    final newMode = !state;
    await repository.setIsAdminMode(newMode);
    state = newMode;
  }
}
