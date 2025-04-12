import 'package:app/src/features/home/domain/sub_category.dart';

final List<SubCategory> testSubCategories = [
  // Subcategories for Residence (categoryId=1)
  SubCategory(id: 1, name: "Rooms", categoryId: 1),
  SubCategory(id: 2, name: "Hostels", categoryId: 1),
  SubCategory(id: 3, name: "Flats", categoryId: 1),
  SubCategory(id: 4, name: "Houses", categoryId: 1),
  SubCategory(id: 6, name: "Hotels", categoryId: 1),

  // Subcategories for Food (categoryId=2)
  SubCategory(id: 6, name: "Restaurants", categoryId: 2),
  SubCategory(id: 7, name: "Cafes", categoryId: 2),
  SubCategory(id: 8, name: "Fast Food", categoryId: 2),
  SubCategory(id: 9, name: "Takeaways", categoryId: 2),
  SubCategory(id: 10, name: "Messes", categoryId: 2),
];
