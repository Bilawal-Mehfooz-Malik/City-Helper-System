import 'package:app/src/core/models/my_data_types.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedCategoryNotifier extends Notifier<CategoryId?> {
  @override
  CategoryId? build() => null;

  void setCategoryId(CategoryId id) {
    state = id;
  }
}

final selectedCategoryNotifierProvider =
    NotifierProvider<SelectedCategoryNotifier, CategoryId?>(
      SelectedCategoryNotifier.new,
    );
