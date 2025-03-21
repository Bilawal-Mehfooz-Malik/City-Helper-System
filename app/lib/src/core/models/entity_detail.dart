import 'package:app/src/core/models/my_data_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'entity_detail.freezed.dart';
part 'entity_detail.g.dart';

@freezed
abstract class EntityDetail with _$EntityDetail {
  const factory EntityDetail({
    required EntityId entityId,
    required UserId userId,
    required CategoryId categoryId,
    required SubCategoryId subCategoryId,
    required String name,
    required String description,
    required List<String> imagesUrls,
    required String videoUrl,
    required double avgRating,
    required int reviewsCount,
    required String shopAddress,
    required String shopGeoPoints,
    String? phoneNum,
    String? msgNum,
    String? webUrl,
    String? instaUrl,
    String? fbUrl,
    String? emailAddress,
  }) = _EntityDetail;

  factory EntityDetail.fromJson(Map<String, Object?> json) =>
      _$EntityDetailFromJson(json);
}
