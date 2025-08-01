import 'package:app/src/core/models/my_data_types.dart';

class SubCategory {
  final CategoryId categoryId;
  final SubCategoryId id;
  final String name;
  final int sortOrder;

  SubCategory({
    required this.categoryId,
    required this.id,
    required this.name,
    required this.sortOrder,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'categoryId': categoryId,
    'name': name,
    'sortOrder': sortOrder,
  };

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['id'] as int,
      categoryId: json['categoryId'] as int,
      name: json['name'] as String,
      sortOrder: json['sortOrder'] as int,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubCategory &&
          id == other.id &&
          categoryId == other.categoryId &&
          name == other.name &&
          sortOrder == other.sortOrder;

  @override
  int get hashCode =>
      id.hashCode ^ categoryId.hashCode ^ name.hashCode ^ sortOrder.hashCode;

  @override
  String toString() =>
      'SubCategory(id: $id, categoryId: $categoryId, '
      'name: $name, sortOrder: $sortOrder)';
}
