import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_options.dart';
import 'package:app/src/core/exceptions/app_logger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final firestore = FirebaseFirestore.instance;

  // === CATEGORIES ===
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
  //   AppLogger.logInfo('✅ Uploaded category: $docId');
  // }

  // === SUBCATEGORIES ===
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
  //   AppLogger.logInfo('✅ Uploaded subcategory: ${sub['name']}');
  // }

  // === SAMPLE LISTINGS ===
  // --- Food Listing ---
  // final food = {
  //   "id": "food-001",
  //   "categoryId": 2,
  //   "subCategoryId": 6,
  //   "coverImageUrl": "https://example.com/images/food-cover.jpg",
  //   "name": "Tandoori Flames",
  //   "cityName": "Lahore",
  //   "sectorName": "DHA Phase 3",
  //   "latLng": [31.5204, 74.3587],
  //   "avgRating": 4.4,
  //   "totalReviews": 120,
  //   "ratingBreakdown": [
  //     {"stars": 5, "count": 75},
  //     {"stars": 4, "count": 30},
  //     {"stars": 3, "count": 10},
  //     {"stars": 2, "count": 3},
  //     {"stars": 1, "count": 2},
  //   ],
  //   "isPopular": true,
  //   "openingHours": List.generate(
  //     7,
  //     (i) => {
  //       "day": [
  //         "Monday",
  //         "Tuesday",
  //         "Wednesday",
  //         "Thursday",
  //         "Friday",
  //         "Saturday",
  //         "Sunday",
  //       ][i],
  //       "open": "12:00",
  //       "close": "23:00",
  //     },
  //   ),
  //   "entityStatus": "open",
  //   "createdAt": DateTime.now().toIso8601String(),
  //   "updatedAt": DateTime.now().toIso8601String(),
  //   "ownerId": "user-xyz",
  //   "description":
  //       "Authentic desi cuisine served hot and fresh. Family-friendly.",
  //   "imageUrls": [
  //     "https://example.com/images/food1.jpg",
  //     "https://example.com/images/food2.jpg",
  //   ],
  //   "streetAddress": "123 Main Blvd",
  //   "phoneNumber": "03211234567",
  //   "messagingNumber": "03211234567",
  //   "websiteUrl": "https://tandooriflames.pk",
  //   "instagramUrl": "https://instagram.com/tandooriflames",
  //   "facebookUrl": "https://facebook.com/tandooriflames",
  //   "email": "contact@tandooriflames.pk",
  //   "genderPref": "any",
  // };

  // await firestore
  //     .collection('food_listings')
  //     .doc(food['id'] as String)
  //     .set(food);
  // AppLogger.logInfo('✅ Sample FoodDetail uploaded');

  // --- Residence Listing ---
  final residence = {
    "id": "res-001",
    "categoryId": 1,
    "subCategoryId": 2,
    "coverImageUrl": "https://example.com/images/residence-cover.jpg",
    "name": "Comfort Boys Hostel",
    "cityName": "Islamabad",
    "sectorName": "G-10",
    "latLng": [31.5204, 74.3587],
    "avgRating": 4.2,
    "totalReviews": 85,
    "ratingBreakdown": [
      {"stars": 5, "count": 50},
      {"stars": 4, "count": 20},
      {"stars": 3, "count": 10},
      {"stars": 2, "count": 3},
      {"stars": 1, "count": 2},
    ],
    "isPopular": true,
    "openingHours": List.generate(
      7,
      (i) => {
        "day": [
          "Monday",
          "Tuesday",
          "Wednesday",
          "Thursday",
          "Friday",
          "Saturday",
          "Sunday",
        ][i],
        "open": "00:00",
        "close": "23:59",
      },
    ),
    "entityStatus": "open",
    "createdAt": DateTime.now().toIso8601String(),
    "updatedAt": DateTime.now().toIso8601String(),
    "ownerId": "user-abc",
    "description":
        "Clean and affordable hostel for male students and professionals.",
    "imageUrls": [
      "https://example.com/images/res1.jpg",
      "https://example.com/images/res2.jpg",
    ],
    "streetAddress": "456 Hostel Road",
    "phoneNumber": "03339876543",
    "messagingNumber": "03339876543",
    "websiteUrl": "https://comforthostel.pk",
    "instagramUrl": "https://instagram.com/comforthostel",
    "facebookUrl": "https://facebook.com/comforthostel",
    "email": "info@comforthostel.pk",
    "price": 17000.0,
    "isFurnished": true,
    "genderPref": "maleOnly",
  };

  await firestore
      .collection('residence_listings')
      .doc(residence['id']! as String)
      .set(residence);
  AppLogger.logInfo('✅ Sample Residence uploaded');

  // === REVIEWS ===
  // final sampleReviews = [
  //   {
  //     'userId': 'user-abc',
  //     'entityId': 'food-001',
  //     'rating': 4.5,
  //     'comment': 'Great food and quick service!',
  //     'updatedAt': DateTime.now().toIso8601String(),
  //   },
  //   {
  //     'userId': 'user-def',
  //     'entityId': 'food-001',
  //     'rating': 3.5,
  //     'comment': 'Good taste but expensive.',
  //     'updatedAt': DateTime.now().toIso8601String(),
  //   },
  //   {
  //     'userId': 'user-xyz',
  //     'entityId': 'res-001',
  //     'rating': 5.0,
  //     'comment': 'Clean and peaceful environment.',
  //     'updatedAt': DateTime.now().toIso8601String(),
  //   },
  // ];

  // for (final review in sampleReviews) {
  //   await firestore.collection('reviews').add(review);
  //   AppLogger.logInfo('✅ Uploaded review by ${review['userId']}');
  // }

  AppLogger.logInfo('🎉 All data uploaded successfully!');
}
