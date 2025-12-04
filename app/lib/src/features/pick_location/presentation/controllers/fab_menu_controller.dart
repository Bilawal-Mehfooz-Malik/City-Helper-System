import 'package:flutter_riverpod/flutter_riverpod.dart';

class FabMenuController extends Notifier<bool> {
  @override
  bool build() => false;

  void toggle() => state = !state;
}

final fabMenuControllerProvider =
    NotifierProvider.autoDispose<FabMenuController, bool>(
      FabMenuController.new,
    );
