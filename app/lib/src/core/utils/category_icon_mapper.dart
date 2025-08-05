import 'package:flutter/material.dart';

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
