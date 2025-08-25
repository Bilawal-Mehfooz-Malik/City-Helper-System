import 'package:app/src/core/constants/test_carousel_ads.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/data/fake/fake_ads_carousel_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late FakeAdsCarouselRepository repository;

  setUp(() {
    repository = FakeAdsCarouselRepository(addDelay: false);
  });

  group('FakeAdsCarouselRepository', () {
    group('fetchCarouselAds', () {
      test('returns only ads for given categoryId', () async {
        final categoryId = testCarouselAds.first.categoryId;
        final result = await repository.fetchCarouselAds(categoryId);

        // All returned ads should have the correct categoryId
        expect(result.every((ad) => ad.categoryId == categoryId), isTrue);
        // Should not be empty as there are matching ads
        expect(result, isNotEmpty);
      });

      test(
        'returns ads filtered by subcategoryId when provided',
        () async {
          final adWithSubcategory = testCarouselAds.firstWhere((ad) => ad.subcategoryId != null);
          final categoryId = adWithSubcategory.categoryId;
          final subcategoryId = adWithSubcategory.subcategoryId!;

          final result = await repository.fetchCarouselAds(
            categoryId,
            subcategoryId: subcategoryId,
          );

          // All returned ads should have the correct categoryId and subcategoryId
          expect(
            result.every((ad) =>
                ad.categoryId == categoryId && ad.subcategoryId == subcategoryId),
            isTrue,
          );
          expect(result, isNotEmpty);
        },
      );

      test('returns an empty list for a category with no valid ads', () async {
        const nonExistentCategoryId = 999;
        final result = await repository.fetchCarouselAds(nonExistentCategoryId);
        expect(result, isEmpty);
      });
    });

    group('recordAdClick', () {
      test('increments click count for the given adId', () async {
        final ad = testCarouselAds.first;
        final initialAdState = await repository.fetchAdById(ad.id);
        expect(initialAdState, isNotNull);

        await repository.recordAdClick(ad.id);

        final finalAdState = await repository.fetchAdById(ad.id);
        expect(finalAdState, isNotNull);
        expect(finalAdState!.clickCount, initialAdState!.clickCount + 1);
      });
    });

    group('recordAdImpression', () {
      test('increments impression count and updates lastShownAt', () async {
        final ad = testCarouselAds.first;
        final initialAdState = await repository.fetchAdById(ad.id);
        expect(initialAdState, isNotNull);

        await repository.recordAdImpression(ad.id);

        final finalAdState = await repository.fetchAdById(ad.id);
        expect(finalAdState, isNotNull);
        expect(
          finalAdState!.impressionCount,
          initialAdState!.impressionCount + 1,
        );
        // lastShownAt should be updated, so it's not equal to the initial state's lastShownAt
        expect(finalAdState.lastShownAt, isNot(initialAdState.lastShownAt));
      });
    });

    group('fetchAdById', () {
      test('returns correct ad', () async {
        final ad = testCarouselAds.first;
        final result = await repository.fetchAdById(ad.id);

        expect(result, ad);
      });

      test('returns null for invalid id', () async {
        const CarouselAdId invalidId = 'invalid-id';
        final result = await repository.fetchAdById(invalidId);

        expect(result, isNull);
      });
    });

    group('watchAdById', () {
      test('emits correct ad', () {
        final ad = testCarouselAds.first;
        expect(repository.watchAdById(ad.id), emits(ad));
      });

      test('emits null for invalid id', () {
        const CarouselAdId invalidId = 'invalid-id';
        expect(repository.watchAdById(invalidId), emits(null));
      });
    });
  });
}
