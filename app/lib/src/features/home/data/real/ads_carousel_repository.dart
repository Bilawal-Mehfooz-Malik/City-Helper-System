import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/carousel_ad.dart';
import 'package:app/src/features/home/presentation/controllers/subcategory_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ads_carousel_repository.g.dart';

class AdsCarouselRepository {
  static String get adsCarouselKey => 'ads_carousel';

  Future<List<CarouselAd>> fetchAds(CategoryId categoryId) async {
    throw UnimplementedError();
  }

  Stream<List<CarouselAd>> watchAds(CategoryId categoryId) {
    throw UnimplementedError();
  }

  Future<List<CarouselAd>> fetchAdsBySubCategory(
    CategoryId categoryId,
    SubCategoryId subCategoryId,
  ) async {
    throw UnimplementedError();
  }

  Stream<List<CarouselAd>> watchAdsBySubCategory(
    CategoryId categoryId,
    SubCategoryId subCategoryId,
  ) {
    throw UnimplementedError();
  }

  Future<CarouselAd?> fetchAdById(CarouselAdId adId) async {
    throw UnimplementedError();
  }

  Stream<CarouselAd?> watchAdById(CarouselAdId adId) {
    throw UnimplementedError();
  }
}

@Riverpod(keepAlive: true)
AdsCarouselRepository adsCarouselRepository(Ref ref) {
  return AdsCarouselRepository();
}

@riverpod
Stream<List<CarouselAd>> adsListStream(Ref ref, CategoryId categoryId) {
  final repo = ref.watch(adsCarouselRepositoryProvider);
  final selectedSubcategory = ref.watch(subcategoryControllerProvider);

  if (selectedSubcategory != null) {
    return repo.watchAdsBySubCategory(categoryId, selectedSubcategory);
  }

  return repo.watchAds(categoryId);
}

@riverpod
Future<List<CarouselAd>> adsListFuture(Ref ref, CategoryId categoryId) {
  final repo = ref.watch(adsCarouselRepositoryProvider);
  final selectedSubcategory = ref.watch(subcategoryControllerProvider);

  if (selectedSubcategory != null) {
    return repo.fetchAdsBySubCategory(categoryId, selectedSubcategory);
  }

  return repo.fetchAds(categoryId);
}

@riverpod
Stream<CarouselAd?> adStream(Ref ref, CarouselAdId adId) {
  final repo = ref.watch(adsCarouselRepositoryProvider);
  return repo.watchAdById(adId);
}

@riverpod
Future<CarouselAd?> adFuture(Ref ref, CarouselAdId adId) {
  final repo = ref.watch(adsCarouselRepositoryProvider);
  return repo.fetchAdById(adId);
}
