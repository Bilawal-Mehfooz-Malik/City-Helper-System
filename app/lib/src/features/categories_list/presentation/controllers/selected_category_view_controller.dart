import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SelectedCategoryView { home, popular }

class SelectedCategoryViewController extends Notifier<SelectedCategoryView> {
  @override
  SelectedCategoryView build() {
    return SelectedCategoryView.home;
  }

  void setSelectedCategoryView(SelectedCategoryView view) {
    state = view;
  }
}

final selectedCategoryViewControllerProvider =
    NotifierProvider.autoDispose<
      SelectedCategoryViewController,
      SelectedCategoryView
    >(SelectedCategoryViewController.new);
