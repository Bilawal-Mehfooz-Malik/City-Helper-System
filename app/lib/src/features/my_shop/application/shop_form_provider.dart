import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/home/domain/sub_category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app/src/features/categories_list/data/categories_repository.dart';
import 'package:app/src/features/home/data/real/sub_categories_repository.dart';

part 'shop_form_provider.g.dart';

class ShopFormInitialData {
  final Category? selectedCategory;
  final SubCategory? selectedSubCategory;
  final List<Category> allCategories;
  final List<SubCategory> subCategoryOptions;

  ShopFormInitialData({
    required this.selectedCategory,
    required this.selectedSubCategory,
    required this.allCategories,
    required this.subCategoryOptions,
  });
}

@riverpod
Future<ShopFormInitialData> initialShopCategoryData(
  Ref ref, {
  required CategoryId categoryId,
  required SubCategoryId? subCategoryId,
}) async {
  final selectedCategoryFuture = ref.watch(
    categoryFutureProvider(categoryId).future,
  );
  final allCategoriesFuture = ref.watch(categoriesListFutureProvider.future);
  final subCategoryOptionsFuture = ref.watch(
    subCategoriesListFutureProvider(categoryId).future,
  );

  final selectedSubCategoryFuture = subCategoryId != null
      ? ref.watch(subCategoryFutureProvider(subCategoryId).future)
      : Future.value(null);

  final results = await Future.wait([
    selectedCategoryFuture,
    selectedSubCategoryFuture,
    allCategoriesFuture,
    subCategoryOptionsFuture,
  ]);

  return ShopFormInitialData(
    selectedCategory: results[0] as Category?,
    selectedSubCategory: results[1] as SubCategory?,
    allCategories: results[2] as List<Category>,
    subCategoryOptions: results[3] as List<SubCategory>,
  );
}
