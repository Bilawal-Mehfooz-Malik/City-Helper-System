import 'package:app/src/core/models/my_data_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'carousel_ad.freezed.dart';
part 'carousel_ad.g.dart';

@freezed
abstract class CarouselAd with _$CarouselAd {
  const factory CarouselAd({
    required CategoryId categoryId,
    required CarouselId id,
    required String title,
    required String imageUrl,
    required String targetUrl,
    required DateTime createdAt,
  }) = _CarouselAd;

  factory CarouselAd.fromJson(Map<String, Object?> json) =>
      _$CarouselAdFromJson(json);
}
