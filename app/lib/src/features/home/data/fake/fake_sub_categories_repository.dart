import 'dart:async';
import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/core/utils/in_memory_store.dart';
import 'package:app/src/features/home/data/real/sub_categories_repository.dart';
import 'package:app/src/features/home/domain/sub_category.dart';

class FakeSubCategoriesRepository implements SubCategoriesRepository {
  FakeSubCategoriesRepository({this.addDelay = true});
  final bool addDelay;

  /// Preload with the default list of subcategories when the app starts
  final _subCategories = InMemoryStore<List<SubCategory>>(List.from([]));

  /// Retrieve the subcategories list as a [Future] (one-time read)
  @override
  Future<List<SubCategory>> fetchSubCategoriesList() async {
    await delay(addDelay);
    return Future.value(_subCategories.value);
  }

  /// Retrieve the subcategories list as a [Stream] (for realtime updates)
  @override
  Stream<List<SubCategory>> watchSubCategoriesList() {
    return _subCategories.stream;
  }
}
