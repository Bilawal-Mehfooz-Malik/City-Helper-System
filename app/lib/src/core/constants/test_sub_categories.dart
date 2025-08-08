import 'package:app/src/features/home/domain/sub_category.dart';

final List<SubCategory> testSubCategories = [
  // Subcategories for Residence (categoryId = 1)
  SubCategory(id: 1, name: "Hotels", categoryId: 1, sortOrder: 1),
  SubCategory(id: 2, name: "Guest Houses", categoryId: 1, sortOrder: 2),
  SubCategory(id: 3, name: "Hostels", categoryId: 1, sortOrder: 3),
  SubCategory(id: 4, name: "Vacation Homes", categoryId: 1, sortOrder: 4),
  SubCategory(id: 5, name: "Serviced Apartments", categoryId: 1, sortOrder: 5),
  SubCategory(id: 6, name: "Apartments", categoryId: 1, sortOrder: 6),
  SubCategory(id: 7, name: "Private Rooms", categoryId: 1, sortOrder: 7),
  SubCategory(id: 8, name: "Family Homes", categoryId: 1, sortOrder: 8),
  SubCategory(id: 9, name: "Roommates", categoryId: 1, sortOrder: 9),
  SubCategory(id: 10, name: "Houses for Sale", categoryId: 1, sortOrder: 10),
  SubCategory(
    id: 11,
    name: "Apartments for Sale",
    categoryId: 1,
    sortOrder: 11,
  ),

  // Subcategories for Food (categoryId = 2)
  SubCategory(id: 6, name: "Restaurants", categoryId: 2, sortOrder: 1),
  SubCategory(id: 7, name: "Cafes", categoryId: 2, sortOrder: 2),
  SubCategory(id: 8, name: "Fast Food", categoryId: 2, sortOrder: 3),
  SubCategory(id: 9, name: "Dhabas", categoryId: 2, sortOrder: 4),
  SubCategory(id: 10, name: "Street Food", categoryId: 2, sortOrder: 5),
  SubCategory(id: 11, name: "Messes", categoryId: 2, sortOrder: 6),
  SubCategory(
    id: 12,
    name: "Ice Cream & Desserts",
    categoryId: 2,
    sortOrder: 7,
  ),
  SubCategory(id: 13, name: "Bakeries", categoryId: 2, sortOrder: 8),
];
