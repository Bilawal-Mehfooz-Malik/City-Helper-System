// Create a form data class
import 'dart:typed_data';

import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/home/domain/sub_category.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/features/home_detail/domain/food_detail.dart';
import 'package:app/src/features/home_detail/domain/rating_breakdown.dart';
import 'package:app/src/features/home_detail/domain/residence_detail.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShopForm {
  final String name;
  final String description;
  final String phoneNumber;
  final String messagingNumber;
  final String cityName;
  final String sectorName;
  final String streetAddress;
  final String email;
  final String facebookUrl;
  final String instagramUrl;
  final String websiteUrl;
  final Category category;
  final SubCategory? subCategory;
  final LatLng latLng;
  final Uint8List coverImageBytes;
  final List<Uint8List> galleryImageBytes;
  final List<OpeningHours> openingHours;
  final GenderPreference genderPref;
  final double? price;
  final bool isFurnished;

  ShopForm({
    required this.name,
    required this.description,
    required this.phoneNumber,
    required this.messagingNumber,
    required this.cityName,
    required this.sectorName,
    required this.streetAddress,
    required this.email,
    required this.facebookUrl,
    required this.instagramUrl,
    required this.websiteUrl,
    required this.category,
    required this.subCategory,
    required this.latLng,
    required this.coverImageBytes,
    required this.galleryImageBytes,
    required this.openingHours,
    required this.genderPref,
    required this.price,
    required this.isFurnished,
  });

  EntityDetail toEntityDetail() {
    final commonProps = {
      'id': '',
      'ownerId': '',
      'categoryId': category.id,
      'subCategoryId': subCategory!.id,
      'coverImageUrl': '',
      'galleryImageUrls': <String>[],
      'latLng': latLng,
      'name': name,
      'description': description,
      'cityName': cityName,
      'sectorName': sectorName,
      'streetAddress': streetAddress,
      'avgRating': 0,
      'totalReviews': 0,
      'ratingBreakdown': <RatingBreakdown>[],
      'isPopular': false,
      'status': Status.pending,
      'entityStatus': EntityStatus.defaultStatus,
      'openingHours': openingHours,
      'updatedAt': DateTime.now(),
      'createdAt': DateTime.now(),
      'phoneNumber': phoneNumber,
      'messagingNumber': messagingNumber,
      'email': email,
      'facebookUrl': facebookUrl,
      'instagramUrl': instagramUrl,
      'websiteUrl': websiteUrl,
      'genderPref': genderPref,
    };

    if (category.id == 1) {
      return ResidenceDetail(
        id: commonProps['id'] as EntityId,
        ownerId: commonProps['ownerId'] as UserId,
        categoryId: commonProps['categoryId'] as CategoryId,
        subCategoryId: commonProps['subCategoryId'] as SubCategoryId,
        coverImageUrl: commonProps['coverImageUrl'] as String,
        galleryImageUrls: commonProps['galleryImageUrls'] as List<String>,
        latLng: commonProps['latLng'] as LatLng,
        name: commonProps['name'] as String,
        description: commonProps['description'] as String,
        cityName: commonProps['cityName'] as String,
        sectorName: commonProps['sectorName'] as String,
        streetAddress: commonProps['streetAddress'] as String,
        avgRating: commonProps['avgRating'] as double,
        totalReviews: commonProps['totalReviews'] as int,
        ratingBreakdown:
            commonProps['ratingBreakdown'] as List<RatingBreakdown>,
        isPopular: commonProps['isPopular'] as bool,
        status: commonProps['status'] as Status,
        entityStatus: commonProps['entityStatus'] as EntityStatus,
        openingHours: commonProps['openingHours'] as List<OpeningHours>,
        updatedAt: commonProps['updatedAt'] as DateTime,
        createdAt: commonProps['createdAt'] as DateTime,
        phoneNumber: commonProps['phoneNumber'] as String?,
        messagingNumber: commonProps['messagingNumber'] as String?,
        email: commonProps['email'] as String?,
        facebookUrl: commonProps['facebookUrl'] as String?,
        instagramUrl: commonProps['instagramUrl'] as String?,
        websiteUrl: commonProps['websiteUrl'] as String?,
        genderPref: commonProps['genderPref'] as GenderPreference,
        price: price ?? 0,
        isFurnished: isFurnished,
      );
    } else {
      return FoodDetail(
        id: commonProps['id'] as EntityId,
        ownerId: commonProps['ownerId'] as UserId,
        categoryId: commonProps['categoryId'] as CategoryId,
        subCategoryId: commonProps['subCategoryId'] as SubCategoryId,
        coverImageUrl: commonProps['coverImageUrl'] as String,
        galleryImageUrls: commonProps['galleryImageUrls'] as List<String>,
        latLng: commonProps['latLng'] as LatLng,
        name: commonProps['name'] as String,
        description: commonProps['description'] as String,
        cityName: commonProps['cityName'] as String,
        sectorName: commonProps['sectorName'] as String,
        streetAddress: commonProps['streetAddress'] as String,
        avgRating: commonProps['avgRating'] as double,
        totalReviews: commonProps['totalReviews'] as int,
        ratingBreakdown:
            commonProps['ratingBreakdown'] as List<RatingBreakdown>,
        isPopular: commonProps['isPopular'] as bool,
        status: commonProps['status'] as Status,
        entityStatus: commonProps['entityStatus'] as EntityStatus,
        openingHours: commonProps['openingHours'] as List<OpeningHours>,
        updatedAt: commonProps['updatedAt'] as DateTime,
        createdAt: commonProps['createdAt'] as DateTime,
        phoneNumber: commonProps['phoneNumber'] as String?,
        messagingNumber: commonProps['messagingNumber'] as String?,
        email: commonProps['email'] as String?,
        facebookUrl: commonProps['facebookUrl'] as String?,
        instagramUrl: commonProps['instagramUrl'] as String?,
        websiteUrl: commonProps['websiteUrl'] as String?,
        genderPref: commonProps['genderPref'] as GenderPreference,
      );
    }
  }
}
