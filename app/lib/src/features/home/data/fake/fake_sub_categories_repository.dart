import 'dart:async';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/core/utils/in_memory_store.dart';
import 'package:app/src/core/constants/test_sub_categories.dart';
import 'package:app/src/features/home/data/real/sub_categories_repository.dart';
import 'package:app/src/features/home/domain/sub_category.dart';

class FakeSubCategoriesRepository implements SubCategoriesRepository {
  FakeSubCategoriesRepository({this.addDelay = true});
  final bool addDelay;

  /// Preload with the default list of subcategories when the app starts
  final _subCategories = InMemoryStore<List<SubCategory>>(
    List.from(testSubCategories),
  );

  @override
  Future<List<SubCategory>> fetchSubCategoriesList(CategoryId id) async {
    await delay(addDelay);
    return Future.value(_filterSubCategoriesByCategoryId(id));
  }

  @override
  Stream<List<SubCategory>> watchSubCategoriesList(CategoryId id) {
    return _subCategories.stream.map(
      (subCategories) => _filterSubCategoriesByCategoryId(id),
    );
  }

  // * Helper method to filter subcategories by category id
  List<SubCategory> _filterSubCategoriesByCategoryId(CategoryId id) {
    return _subCategories.value
        .where((subCategory) => subCategory.categoryId == id)
        .toList();
  }
}
