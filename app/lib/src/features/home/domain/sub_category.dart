import 'package:app/src/core/models/my_data_types.dart';

class SubCategory {
  final CategoryId categoryId;
  final SubCategoryId id;
  final String name;

  SubCategory({required this.categoryId, required this.id, required this.name});
}
