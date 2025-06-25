import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_options.dart';
import 'package:app/src/core/exceptions/app_logger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final firestore = FirebaseFirestore.instance;

  // // === CATEGORIES ===
  // final categories = [
  //   {
  //     'id': 1,
  //     'name': 'Residences',
  //     'description':
  //         'Find rooms, flats, hostels, houses, and other residential options.',
  //     'iconName': 'home',
  //     'sortOrder': 1,
  //   },
  //   {
  //     'id': 2,
  //     'name': 'Food',
  //     'description':
  //         'Discover restaurants, cafes, takeaways, mess services, and other local food options.',
  //     'iconName': 'restaurant',
  //     'sortOrder': 2,
  //   },
  // ];

  // for (final category in categories) {
  //   final docId = category['id'].toString();
  //   await firestore.collection('categories').doc(docId).set(category);
  //   AppLogger.logInfo('Uploaded category: $docId');
  // }

  // // === SUBCATEGORIES ===
  // final subcategories = [
  //   {'id': 1, 'name': 'Rooms', 'categoryId': 1, 'sortOrder': 1},
  //   {'id': 2, 'name': 'Hostels', 'categoryId': 1, 'sortOrder': 2},
  //   {'id': 3, 'name': 'Flats', 'categoryId': 1, 'sortOrder': 3},
  //   {'id': 4, 'name': 'Houses', 'categoryId': 1, 'sortOrder': 4},
  //   {'id': 5, 'name': 'Hotels', 'categoryId': 1, 'sortOrder': 5},
  //   {'id': 6, 'name': 'Restaurants', 'categoryId': 2, 'sortOrder': 1},
  //   {'id': 7, 'name': 'Cafes', 'categoryId': 2, 'sortOrder': 2},
  //   {'id': 8, 'name': 'Fast Food', 'categoryId': 2, 'sortOrder': 3},
  //   {'id': 9, 'name': 'Dhabas', 'categoryId': 2, 'sortOrder': 4},
  //   {'id': 10, 'name': 'Street Food', 'categoryId': 2, 'sortOrder': 5},
  //   {'id': 11, 'name': 'Messes', 'categoryId': 2, 'sortOrder': 6},
  //   {'id': 12, 'name': 'Ice Cream & Desserts', 'categoryId': 2, 'sortOrder': 7},
  //   {'id': 13, 'name': 'Bakeries', 'categoryId': 2, 'sortOrder': 8},
  // ];

  // for (final sub in subcategories) {
  //   final docId = sub['id'].toString();
  //   await firestore.collection('subcategories').doc(docId).set(sub);
  //   AppLogger.logInfo('Uploaded subcategory: ${sub['name']} with ID $docId');
  // }

  // === SAMPLE FOOD LISTING ===
  final food = {
    "id": "food-001",
    "categoryId": 2,
    "subCategoryId": 6,
    "coverImageUrl": "https://example.com/food1.jpg",
    "name": "Lahori Grill",
    "cityName": "Lahore",
    "sectorName": "Gulberg",
    "latLng": [31.5204, 74.3587],
    "avgRating": 4.6,
    "totalReviews": 95,
    "ratingBreakdown": [
      {"stars": 5, "count": 60},
      {"stars": 4, "count": 20},
      {"stars": 3, "count": 10},
      {"stars": 2, "count": 3},
      {"stars": 1, "count": 2},
    ],
    "isPopular": true,
    "openingHours": List.generate(
      7,
      (i) => {"day": i + 1, "open": "10:00", "close": "22:00"},
    ),
    "entityStatus": "open",
    "createdAt": DateTime.now().toIso8601String(),
    "genderPref": "any",
  };

  await firestore.collection('food_listings').add(food);
  AppLogger.logInfo('✅ Sample FoodDetail uploaded');

  // === SAMPLE RESIDENCE LISTING ===
  final residence = {
    "id": "res-001",
    "categoryId": 1,
    "subCategoryId": 2,
    "coverImageUrl": "https://example.com/residence1.jpg",
    "name": "Green Hostel",
    "cityName": "Islamabad",
    "sectorName": "G-10",
    "latLng": [33.6844, 73.0479],
    "avgRating": 4.3,
    "totalReviews": 80,
    "ratingBreakdown": [
      {"stars": 5, "count": 50},
      {"stars": 4, "count": 20},
      {"stars": 3, "count": 5},
      {"stars": 2, "count": 3},
      {"stars": 1, "count": 2},
    ],
    "isPopular": true,
    "openingHours": List.generate(
      7,
      (i) => {"day": i + 1, "open": "00:00", "close": "23:59"},
    ),
    "entityStatus": "open",
    "createdAt": DateTime.now().toIso8601String(),
    "price": 18000.0,
    "isFurnished": true,
    "genderPref": "maleOnly",
  };

  await firestore.collection('residence_listings').add(residence);
  AppLogger.logInfo('✅ Sample ResidenceDetail uploaded');

  // === SAMPLE REVIEWS ===
  // final sampleReviews = [
  //   Review(
  //     userId: 'user-abc',
  //     entityId: 'some-entity-id-1',
  //     rating: 4.5,
  //     comment: 'Great place with amazing food!',
  //     updatedAt: DateTime.now(),
  //   ),
  //   Review(
  //     userId: 'user-def',
  //     entityId: 'some-entity-id-1',
  //     rating: 3.0,
  //     comment: 'Average experience, could be cleaner.',
  //     updatedAt: DateTime.now(),
  //   ),
  //   Review(
  //     userId: 'user-xyz',
  //     entityId: 'some-entity-id-2',
  //     rating: 5.0,
  //     comment: 'Absolutely loved it! Highly recommended.',
  //     updatedAt: DateTime.now(),
  //   ),
  // ];

  // for (final review in sampleReviews) {
  //   await firestore.collection('reviews').add({
  //     'userId': review.userId,
  //     'entityId': review.entityId,
  //     'rating': review.rating,
  //     'comment': review.comment,
  //     'updatedAt': review.updatedAt.toIso8601String(),
  //   });
  //   AppLogger.logInfo('Uploaded review by: ${review.userId}');
  // }

  // AppLogger.logInfo('✅ Sample reviews uploaded!');

  AppLogger.logInfo('🎉 All data uploaded successfully!');
}
