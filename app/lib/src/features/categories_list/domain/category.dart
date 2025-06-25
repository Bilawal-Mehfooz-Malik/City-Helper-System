import 'package:app/src/core/models/my_data_types.dart';
import 'package:flutter/material.dart';

class Category {
  final CategoryId id;
  final String name;
  final String description;
  final String icon;
  final int sortOrder;

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.sortOrder,
  });

  Category copyWith({
    CategoryId? id,
    String? name,
    String? description,
    String? icon,
    int? sortOrder,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'iconName': icon,
      'sortOrder': sortOrder,
    };
  }

  static Category fromJson(Map<String, Object?> json) {
    return Category(
      id: json['id'] as CategoryId,
      name: json['name'] as String,
      description: json['description'] as String,
      icon: json['iconName'] as String,
      sortOrder: json['sortOrder'] as int,
    );
  }

  @override
  String toString() {
    return 'Category(id: $id, name: $name, description: $description, icon: $icon, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return other is Category &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.icon == icon &&
        other.sortOrder == sortOrder;
  }

  @override
  int get hashCode => Object.hash(id, name, description, icon, sortOrder);

  IconData getCategoryIcon(String iconName) {
    switch (iconName) {
      case 'residence':
        return Icons.home;
      case 'food':
        return Icons.fastfood;
      default:
        return Icons.category;
    }
  }
}
