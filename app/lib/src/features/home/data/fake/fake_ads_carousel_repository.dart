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
  Future<List<CarouselAd>> fetchCarouselAds(
    CategoryId categoryId, {
    SubCategoryId? subcategoryId,
  }) async {
    await delay(addDelay);
    // Filter active, approved, and date-valid ads for the category and optionally subcategory
    final now = DateTime.now();

    // Filter active, approved, and date-valid ads for the category and optionally subcategory
    final eligibleAds = _ads.value
        .where(
          (ad) =>
              ad.categoryId == categoryId &&
              (subcategoryId == null
                  ? true
                  : ad.subcategoryId ==
                        subcategoryId) && // Added subcategoryId filter
              ad.isActive &&
              ad.status == AdApprovalStatus.approved &&
              ad.startDate.isBefore(now) &&
              ad.endDate.isAfter(now),
        )
        .toList();

    eligibleAds.sort((a, b) {
      if (a.priorityScore != b.priorityScore) {
        return b.priorityScore.compareTo(a.priorityScore); // Higher score first
      }
      // For round-robin, ads shown longer ago come first
      if (a.lastShownAt == null && b.lastShownAt != null) return -1;
      if (a.lastShownAt != null && b.lastShownAt == null) return 1;
      if (a.lastShownAt == null && b.lastShownAt == null) return 0;
      return a.lastShownAt!.compareTo(b.lastShownAt!);
    });

    final List<CarouselAd> selectedAds = [];
    final Map<int, int> quota = {
      3: 2,
      2: 2,
      1: 1,
    }; // Featured:2, Premium:2, Basic:1
    final Map<int, int> fetchedCount = {3: 0, 2: 0, 1: 0};

    // Fill quotas sequentially with fallback
    for (final ad in eligibleAds) {
      if (selectedAds.length >= 5) break; // Max 5 ads

      if (fetchedCount[ad.priorityScore]! < quota[ad.priorityScore]!) {
        selectedAds.add(ad);
        fetchedCount[ad.priorityScore] = fetchedCount[ad.priorityScore]! + 1;
      }
    }

    // Fill remaining slots from lower tiers if quotas not met
    if (selectedAds.length < 5) {
      final remainingSlots = 5 - selectedAds.length;
      final alreadySelectedIds = selectedAds.map((e) => e.id).toSet();

      final fillAds = eligibleAds
          .where((ad) => !alreadySelectedIds.contains(ad.id))
          .toList();
      fillAds.sort((a, b) {
        if (a.priorityScore != b.priorityScore) {
          return b.priorityScore.compareTo(
            a.priorityScore,
          ); // Higher score first
        }
        if (a.lastShownAt == null && b.lastShownAt != null) return -1;
        if (a.lastShownAt != null && b.lastShownAt == null) return 1;
        if (a.lastShownAt == null && b.lastShownAt == null) return 0;
        return a.lastShownAt!.compareTo(b.lastShownAt!);
      });

      for (var i = 0; i < remainingSlots && i < fillAds.length; i++) {
        selectedAds.add(fillAds[i]);
      }
    }

    // Simulate updating impressionCount and lastShownAt for selected ads
    final updatedAds = _ads.value.map((ad) {
      if (selectedAds.any((selectedAd) => selectedAd.id == ad.id)) {
        return ad.copyWith(
          impressionCount: ad.impressionCount + 1,
          lastShownAt: now,
        );
      }
      return ad;
    }).toList();
    _ads.value = updatedAds;

    return Future.value(selectedAds);
  }

  @override
  Future<void> recordAdImpression(CarouselAdId adId) async {
    await delay(addDelay);
    final now = DateTime.now();
    final updatedAds = _ads.value.map((ad) {
      if (ad.id == adId) {
        return ad.copyWith(
          impressionCount: ad.impressionCount + 1,
          lastShownAt: now,
        );
      } else {
        return ad;
      }
    }).toList();
    _ads.value = updatedAds;
    return Future.value();
  }

  @override
  Future<void> recordAdClick(CarouselAdId adId) async {
    await delay(addDelay);
    final updatedAds = _ads.value.map((ad) {
      if (ad.id == adId) {
        return ad.copyWith(clickCount: ad.clickCount + 1);
      } else {
        return ad;
      }
    }).toList();
    _ads.value = updatedAds;
    return Future.value();
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

  // Helper method to get an ad by its ID
  CarouselAd? _getAdById(List<CarouselAd> ads, CarouselAdId adId) {
    try {
      return ads.firstWhere((ad) => ad.id == adId);
    } catch (e) {
      return null;
    }
  }
}
