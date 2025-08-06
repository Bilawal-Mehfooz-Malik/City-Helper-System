import 'package:app/src/core/models/my_data_types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_category_notifier.g.dart';

@riverpod
class SelectedCategoryNotifier extends _$SelectedCategoryNotifier {
  @override
  CategoryId? build() => null;

  void setCategoryId(CategoryId id) {
    state = id;
  }
}
