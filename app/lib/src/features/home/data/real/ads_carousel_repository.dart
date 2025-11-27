import 'package:app/src/core/exceptions/app_logger.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/carousel_ad.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ads_carousel_repository.g.dart';

class AdsCarouselRepository {
  AdsCarouselRepository(this._functions, this._firestore);

  final FirebaseFunctions _functions;
  final FirebaseFirestore _firestore;

  CollectionReference<CarouselAd> get _adsRef => _firestore
      .collection('carousel_ads')
      .withConverter<CarouselAd>(
        fromFirestore: (snap, _) =>
            CarouselAd.fromJson(Map<String, dynamic>.from(snap.data()!)),
        toFirestore: (ad, _) => ad.toJson(),
      );

  Future<List<CarouselAd>> fetchCarouselAds(
    CategoryId categoryId, {
    SubCategoryId? subcategoryId,
  }) async {
    try {
      final Map<String, dynamic> data = {'categoryId': categoryId};
      if (subcategoryId != null) {
        data['subcategoryId'] = subcategoryId;
      }

      final result = await _functions
          .httpsCallable('getCarouselAds')
          .call<List<dynamic>>(data);

      return result.data
          .map((e) => CarouselAd.fromJson(e as Map<String, dynamic>))
          .toList();
    } on FirebaseFunctionsException catch (e, st) {
      AppLogger.logError(
        'Cloud Function Error: ${e.code} - ${e.message}',
        error: e,
        stackTrace: st,
      );
      rethrow;
    } catch (e, st) {
      AppLogger.logError(
        'Error fetching carousel ads: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<void> recordAdImpressions(List<CarouselAdId> adIds) async {
    if (adIds.isEmpty) return;
    await _functions.httpsCallable('recordAdImpressions').call<void>({
      'adIds': adIds,
    });
  }

  Future<void> recordAdClick(CarouselAdId adId) async {
    await _functions.httpsCallable('recordAdClick').call<void>({'adId': adId});
  }

  Future<CarouselAd?> fetchAdById(CarouselAdId adId) async {
    final doc = await _adsRef.doc(adId).get();
    return doc.exists ? doc.data() : null;
  }

  Stream<CarouselAd?> watchAdById(CarouselAdId adId) {
    return _adsRef
        .doc(adId)
        .snapshots()
        .map((doc) => doc.exists ? doc.data() : null);
  }
}

@Riverpod(keepAlive: true)
AdsCarouselRepository adsCarouselRepository(Ref ref) {
  return AdsCarouselRepository(
    FirebaseFunctions.instance,
    FirebaseFirestore.instance,
  );
}

@Riverpod(keepAlive: true)
Future<List<CarouselAd>> carouselAdsListFuture(
  Ref ref,
  CategoryId categoryId, {
  SubCategoryId? subcategoryId,
}) {
  final repo = ref.watch(adsCarouselRepositoryProvider);
  return repo.fetchCarouselAds(categoryId, subcategoryId: subcategoryId);
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

@Riverpod(keepAlive: true)
Future<List<CarouselAd>> finalCarouselAds(
  Ref ref,
  CategoryId categoryId, {
  SubCategoryId? subcategoryId,
}) async {
  final ads = await ref.watch(
    carouselAdsListFutureProvider(
      categoryId,
      subcategoryId: subcategoryId,
    ).future,
  );

  if (ads.isNotEmpty || subcategoryId == null) {
    return ads;
  }

  return ref.watch(
    carouselAdsListFutureProvider(categoryId, subcategoryId: null).future,
  );
}
