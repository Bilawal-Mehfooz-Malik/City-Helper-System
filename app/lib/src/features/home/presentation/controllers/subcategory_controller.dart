import 'package:app/src/core/models/my_data_types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'subcategory_controller.g.dart';

@riverpod
class SubcategoryController extends _$SubcategoryController {
  @override
  SubCategoryId? build() => null;

  void selectSubcategory(SubCategoryId? subcategoryId) {
    state = subcategoryId;
  }

  void resetSubcategoryState() {
    state = null;
  }
}
