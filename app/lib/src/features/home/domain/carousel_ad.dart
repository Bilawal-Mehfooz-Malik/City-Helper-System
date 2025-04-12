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
}
