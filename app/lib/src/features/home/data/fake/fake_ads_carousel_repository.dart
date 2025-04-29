import 'dart:async';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/core/utils/in_memory_store.dart';
import 'package:app/src/core/constants/test_carousel_ads.dart';
import 'package:app/src/features/home/data/real/ads_carousel_repository.dart';
import 'package:app/src/features/home/domain/carousel_ad.dart';

class FakeAdsCarouselRepository implements AdsCarouselRepository {
  FakeAdsCarouselRepository({this.addDelay = true});
  final bool addDelay;

  // Preload with a default list of carousel ads
  final _ads = InMemoryStore<List<CarouselAd>>(List.from(testCarouselAds));

  @override
  Future<List<CarouselAd>> fetchAds(CategoryId categoryId) async {
    await delay(addDelay);
    return Future.value(_filterAdsByCategory(_ads.value, categoryId));
  }

  @override
  Stream<List<CarouselAd>> watchAds(CategoryId categoryId) async* {
    await delay(addDelay);
    yield* _ads.stream.map((ads) => _filterAdsByCategory(ads, categoryId));
  }

  @override
  Future<List<CarouselAd>> fetchAdsBySubCategory(
    CategoryId categoryId,
    SubCategoryId subCategoryId,
  ) async {
    await delay(addDelay);
    return Future.value(
      _filterAdsBySubCategory(_ads.value, categoryId, subCategoryId),
    );
  }

  @override
  Stream<List<CarouselAd>> watchAdsBySubCategory(
    CategoryId categoryId,
    SubCategoryId subCategoryId,
  ) async* {
    await delay(addDelay);
    yield* _ads.stream.map(
      (ads) => _filterAdsBySubCategory(ads, categoryId, subCategoryId),
    );
  }

  @override
  Future<CarouselAd?> fetchAdById(CarouselAdId adId) async {
    await delay(addDelay);
    return Future.value(_getAdById(_ads.value, adId));
  }

  @override
  Stream<CarouselAd?> watchAdById(CarouselAdId adId) async* {
    await delay(addDelay);
    yield* _ads.stream.map((ads) => _getAdById(ads, adId));
  }

  //  Helper method to filter ads by category
  List<CarouselAd> _filterAdsByCategory(
    List<CarouselAd> ads,
    CategoryId categoryId,
  ) {
    return ads.where((ad) => ad.categoryId == categoryId).toList();
  }

  //  Helper method to filter ads by both category and subcategory
  List<CarouselAd> _filterAdsBySubCategory(
    List<CarouselAd> ads,
    CategoryId categoryId,
    SubCategoryId subCategoryId,
  ) {
    return ads
        .where(
          (ad) =>
              ad.categoryId == categoryId && ad.subCategoryId == subCategoryId,
        )
        .toList();
  }

  //  Helper method to get an ad by its ID
  CarouselAd? _getAdById(List<CarouselAd> ads, CarouselAdId adId) {
    try {
      return ads.firstWhere((ad) => ad.id == adId);
    } catch (e) {
      return null;
    }
  }
}
