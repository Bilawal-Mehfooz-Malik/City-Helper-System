import 'package:flutter/material.dart';

IconData getCategoryIcon(String iconName) {
  final Map<String, IconData> iconMap = {
    'home': Icons.home,
    'fastfood': Icons.fastfood,
  };

  return iconMap[iconName] ?? Icons.category;
}
