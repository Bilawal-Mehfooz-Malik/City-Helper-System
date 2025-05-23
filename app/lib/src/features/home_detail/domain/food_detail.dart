import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';

class FoodDetail extends EntityDetail {
  final GenderPreference genderPref;
  FoodDetail({
    required super.id,
    required super.categoryId,
    required super.subCategoryId,
    required super.coverImageUrl,
    required super.name,
    required super.cityName,
    required super.sectorName,
    required super.latLng,
    required super.avgRating,
    required super.totalReviews,
    required super.isPopular,
    required super.openingHours,
    required super.entityStatus,
    required super.createdAt,
    required super.ownerId,
    required super.description,
    required super.imageUrls,
    required super.streetAddress,
    required super.phoneNumber,
    required super.messagingNumber,
    required super.updatedAt,
    required this.genderPref,
  });
}
