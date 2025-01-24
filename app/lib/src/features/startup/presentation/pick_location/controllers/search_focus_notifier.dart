import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_focus_notifier.g.dart';

@riverpod
class SearchFocusNotifier extends _$SearchFocusNotifier {
  @override
  bool build() => false;

  void setFocus(bool isFocused) => state = isFocused;
}
