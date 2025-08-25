import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/carousel_ad.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart'; // NEW
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ads_carousel_repository.g.dart';

class AdsCarouselRepository {
  AdsCarouselRepository(
    this._functions,
    this._firestore,
  ); // MODIFIED CONSTRUCTOR

  final FirebaseFunctions _functions; // NEW
  final FirebaseFirestore _firestore; // KEPT FOR fetchAdById/watchAdById

  // Collection reference for direct Firestore reads (e.g., for admin/business owner views)
  CollectionReference<CarouselAd> get _adsRef => _firestore
      .collection('carousel_ads') // Using 'ads' as per plan
      .withConverter<CarouselAd>(
        fromFirestore: (snap, _) =>
            CarouselAd.fromJson(Map<String, dynamic>.from(snap.data()!)),
        toFirestore: (ad, _) => ad.toJson(),
      );

  // Method to fetch ads for the carousel using Cloud Function
  Future<List<CarouselAd>> fetchCarouselAds(
    CategoryId categoryId, {
    SubCategoryId? subcategoryId,
  }) async {
    try {
      // Prepare the data to send to the Cloud Function
      final Map<String, dynamic> data = {'categoryId': categoryId};
      if (subcategoryId != null) {
        data['subcategoryId'] = subcategoryId;
      }

      // The type parameter here is good, it tells you the function returns a list of dynamic items.
      final result = await _functions
          .httpsCallable('getCarouselAds')
          .call<List<dynamic>>(data);

      return result.data
          .map((e) => CarouselAd.fromJson(e as Map<String, dynamic>))
          .toList();
    } on FirebaseFunctionsException catch (e) {
      print('Cloud Function Error: ${e.code} - ${e.message}');
      rethrow;
    } catch (e) {
      print('Error fetching carousel ads: $e');
      rethrow;
    }
  }

  // Method to record ad impression using Cloud Function
  Future<void> recordAdImpression(CarouselAdId adId) async {
    try {
      await _functions.httpsCallable('recordAdImpression').call<dynamic>({
        'adId': adId,
      });
    } on FirebaseFunctionsException catch (e) {
      print('Cloud Function Error: ${e.code} - ${e.message}');
      // Log error, but don't rethrow as it shouldn't block UI
    } catch (e) {
      print('Error recording impression: $e');
    }
  }

  // Method to record ad click using Cloud Function
  Future<void> recordAdClick(CarouselAdId adId) async {
    try {
      await _functions.httpsCallable('recordAdClick').call<dynamic>({
        'adId': adId,
      });
    } on FirebaseFunctionsException catch (e) {
      print('Cloud Function Error: ${e.code} - ${e.message}');
      // Log error, but don't rethrow as it shouldn't block UI
    } catch (e) {
      print('Error recording click: $e');
    }
  }

  // Keep fetchAdById and watchAdById for specific ad lookups (e.g., admin/business owner views)
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
  ); // MODIFIED INITIALIZATION
}

// NEW Riverpod provider for fetching carousel ads
@riverpod
Future<List<CarouselAd>> carouselAdsListFuture(Ref ref, CategoryId categoryId) {
  final repo = ref.watch(adsCarouselRepositoryProvider);
  return repo.fetchCarouselAds(categoryId);
}

// Keep existing adStream and adFuture for specific ad lookups
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
