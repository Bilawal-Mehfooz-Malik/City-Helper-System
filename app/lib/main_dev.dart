import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_options.dart';
import 'package:app/src/core/exceptions/app_logger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final firestore = FirebaseFirestore.instance;

  final categories = [
    {
      'id': 'residence',
      'name': 'Residences',
      'description':
          'Find rooms, flats, hostels, houses, and other residential options.',
      'iconName': 'home',
      'sortOrder': 1,
    },
    {
      'id': 'food',
      'name': 'Food',
      'description':
          'Discover restaurants, cafes, takeaways, mess services, and other local food options.',
      'iconName': 'restaurant',
      'sortOrder': 2,
    },
  ];

  for (final category in categories) {
    final docId = category['id'] as String;
    await firestore.collection('categories').doc(docId).set(category);
    AppLogger.logInfo('Uploaded category: $docId');
  }

  AppLogger.logInfo('✅ All categories uploaded successfully!');
}
