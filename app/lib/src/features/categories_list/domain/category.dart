import 'package:flutter/material.dart';
import 'package:app/src/core/models/my_data_types.dart';

class Category {
  final CategoryId id;
  final String name;
  final String description;
  final IconData icon;
  final int sortOrder;

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.sortOrder,
  });
}
