import 'dart:async';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/core/utils/in_memory_store.dart';
import 'package:app/src/features/categories_list/data/categories_repository.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/categories_list/data/test_categories.dart';

class FakeCategoriesRepository implements CategoriesRepository {
  FakeCategoriesRepository({this.addDelay = true});
  final bool addDelay;

  /// Preload with the default list of categories when the app starts
  final _categories = InMemoryStore<List<Category>>(List.from(testCategories));

  /// Get a category by ID.
  /// In real-world apps, remote data can only be obtained asynchronously.
  Category? getCategory(int id) {
    return _getCategory(_categories.value, id);
  }

  /// Retrieve the categories list as a [Future] (one-time read)
  @override
  Future<List<Category>> fetchCategoriesList() async {
    await delay(addDelay);
    return Future.value(_categories.value);
  }

  /// Retrieve the categories list as a [Stream] (for realtime updates)
  @override
  Stream<List<Category>> watchCategoriesList() {
    delay(addDelay);
    return _categories.stream;
  }

  /// Retrieve a specific category by ID
  @override
  Future<Category?> fetchCategory(int id) async {
    await delay(addDelay);
    return Future.value(_getCategory(_categories.value, id));
  }

  /// Retrieve a specific category by ID as a stream
  @override
  Stream<Category?> watchCategory(int id) {
    delay(addDelay);
    return watchCategoriesList().map(
      (categories) => _getCategory(categories, id),
    );
  }

  /// Private method to get a category by ID safely
  static Category? _getCategory(List<Category> categories, int id) {
    return categories.firstWhereOrNull((category) => category.id == id);
  }
}
