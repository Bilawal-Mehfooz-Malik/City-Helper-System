import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationRailController extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  void toggle() => state = !state;
}

final navigationRailControllerProvider =
    NotifierProvider.autoDispose<NavigationRailController, bool>(
      NavigationRailController.new,
    );
