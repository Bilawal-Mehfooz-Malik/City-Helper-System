import 'package:app/src/core/models/my_data_types.dart';

class CarouselAd {
  final CategoryId categoryId;
  final SubCategoryId subCategoryId;
  final CarouselAdId id;
  final String imageUrl;
  final String targetUrl;
  final DateTime validFrom;
  final DateTime validUntil;

  CarouselAd({
    required this.categoryId,
    required this.subCategoryId,
    required this.id,
    required this.imageUrl,
    required this.targetUrl,
    required this.validFrom,
    required this.validUntil,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'categoryId': categoryId,
    'subCategoryId': subCategoryId,
    'imageUrl': imageUrl,
    'targetUrl': targetUrl,
    'validFrom': validFrom.toIso8601String(),
    'validUntil': validUntil.toIso8601String(),
  };

  factory CarouselAd.fromJson(Map<String, dynamic> json) => CarouselAd(
    id: json['id'] as CarouselAdId,
    categoryId: json['categoryId'] as int,
    subCategoryId: json['subCategoryId'] as int,
    imageUrl: json['imageUrl'] as String,
    targetUrl: json['targetUrl'] as String,
    validFrom: DateTime.parse(json['validFrom'] as String),
    validUntil: DateTime.parse(json['validUntil'] as String),
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CarouselAd &&
          id == other.id &&
          categoryId == other.categoryId &&
          subCategoryId == other.subCategoryId &&
          imageUrl == other.imageUrl &&
          targetUrl == other.targetUrl &&
          validFrom == other.validFrom &&
          validUntil == other.validUntil;

  @override
  int get hashCode =>
      id.hashCode ^
      categoryId.hashCode ^
      subCategoryId.hashCode ^
      imageUrl.hashCode ^
      targetUrl.hashCode ^
      validFrom.hashCode ^
      validUntil.hashCode;

  @override
  String toString() =>
      'CarouselAd(id: $id, categoryId: $categoryId, '
      'subCategoryId: $subCategoryId, imageUrl: $imageUrl, '
      'targetUrl: $targetUrl, validFrom: $validFrom, validUntil: $validUntil)';
}
