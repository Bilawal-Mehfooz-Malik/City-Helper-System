import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_category_view_controller.g.dart';

enum SelectedCategoryView { home, popular, detail }

@riverpod
class SelectedCategoryViewController extends _$SelectedCategoryViewController {
  @override
  SelectedCategoryView build() {
    return SelectedCategoryView.home;
  }

  void setSelectedCategoryView(SelectedCategoryView view) {
    state = view;
  }
}
