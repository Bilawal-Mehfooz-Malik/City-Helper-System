import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/features/home/data/fake/fake_ads_carousel_repository.dart';
import 'package:app/src/core/constants/test_carousel_ads.dart';
import 'package:app/src/core/models/my_data_types.dart';

void main() {
  late FakeAdsCarouselRepository repository;

  setUp(() {
    repository = FakeAdsCarouselRepository(addDelay: false);
  });

  group('FakeAdsCarouselRepository', () {
    test('fetchAds returns only ads for given categoryId', () async {
      final CategoryId categoryId = testCarouselAds.first.categoryId;
      final expected =
          testCarouselAds.where((ad) => ad.categoryId == categoryId).toList();

      final result = await repository.fetchAds(categoryId);
      expect(result, expected);
    });

    test('watchAds emits only ads for given categoryId', () {
      final CategoryId categoryId = testCarouselAds.last.categoryId;
      final expected =
          testCarouselAds.where((ad) => ad.categoryId == categoryId).toList();

      expect(repository.watchAds(categoryId), emits(expected));
    });
    test(
      'fetchAdsBySubCategory returns matching ads for given categoryId and subCategoryId',
      () async {
        final ad = testCarouselAds.first;
        final expectedAds =
            testCarouselAds
                .where(
                  (a) =>
                      a.categoryId == ad.categoryId &&
                      a.subCategoryId == ad.subCategoryId,
                )
                .toList();

        final result = await repository.fetchAdsBySubCategory(
          ad.categoryId,
          ad.subCategoryId,
        );

        expect(result, expectedAds);
      },
    );

    test(
      'watchAdsBySubCategory emits matching ads for given categoryId and subCategoryId',
      () {
        final ad = testCarouselAds.first;
        final expected =
            testCarouselAds
                .where(
                  (a) =>
                      a.categoryId == ad.categoryId &&
                      a.subCategoryId == ad.subCategoryId,
                )
                .toList();

        expect(
          repository.watchAdsBySubCategory(ad.categoryId, ad.subCategoryId),
          emits(expected),
        );
      },
    );

    test('fetchAdById returns correct ad', () async {
      final ad = testCarouselAds.first;
      final result = await repository.fetchAdById(ad.id);

      expect(result, ad);
    });

    test('fetchAdById returns null for invalid id', () async {
      const CarouselAdId invalidId = 'invalid-id';
      final result = await repository.fetchAdById(invalidId);

      expect(result, isNull);
    });

    test('watchAdById emits correct ad', () {
      final ad = testCarouselAds.first;
      expect(repository.watchAdById(ad.id), emits(ad));
    });

    test('watchAdById emits null for invalid id', () {
      const CarouselAdId invalidId = 'invalid-id';
      expect(repository.watchAdById(invalidId), emits(null));
    });
  });
}