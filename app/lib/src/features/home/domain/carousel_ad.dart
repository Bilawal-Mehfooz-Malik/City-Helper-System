import 'package:app/src/core/models/my_data_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'carousel_ad.freezed.dart';
part 'carousel_ad.g.dart';

enum AdStatus {
  active,
  paused,
  archived,
}

@freezed
abstract class CarouselAd with _$CarouselAd {
  const factory CarouselAd({
    required CategoryId categoryId,
    required SubCategoryId subCategoryId,
    required CarouselAdId id,
    required String imageUrl,
    required String targetUrl,
    required DateTime validFrom,
    required DateTime validUntil,
    @Default(AdStatus.active) AdStatus status,
  }) = _CarouselAd;

  factory CarouselAd.fromJson(Map<String, Object?> json) =>
      _$CarouselAdFromJson(json);
}
