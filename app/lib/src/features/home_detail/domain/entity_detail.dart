/*
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/categories/entity.dart';
import 'package:app/src/features/home_detail/domain/rating_breakdown.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'entity_detail.freezed.dart';
part 'entity_detail.g.dart';

@freezed
sealed class EntityDetail with _$EntityDetail {
  const EntityDetail._();

  const factory EntityDetail.residence({
    required Residence residence,
    required String description,
    required List<String> galleryImageUrls,
    required String streetAddress,
    required DateTime updatedAt,
    required UserId ownerId,
    required List<RatingBreakdown> ratingBreakdown,
    String? phoneNumber,
    String? messagingNumber,
    String? websiteUrl,
    String? instagramUrl,
    String? facebookUrl,
    String? email,
  }) = ResidenceDetail;

  const factory EntityDetail.food({
    required Food food,
    required String description,
    required List<String> galleryImageUrls,
    required String streetAddress,
    required DateTime updatedAt,
    required UserId ownerId,
    required List<RatingBreakdown> ratingBreakdown,
    String? phoneNumber,
    String? messagingNumber,
    String? websiteUrl,
    String? instagramUrl,
    String? facebookUrl,
    String? email,
  }) = FoodDetail;

  factory EntityDetail.fromJson(Map<String, Object?> json) =>
      _$EntityDetailFromJson(json);
}
*/