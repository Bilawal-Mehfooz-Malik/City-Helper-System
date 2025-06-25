import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/carousel_ad.dart';
import 'package:app/src/features/home/presentation/controllers/subcategory_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ads_carousel_repository.g.dart';

class AdsCarouselRepository {
  AdsCarouselRepository(this._firestore);

  final FirebaseFirestore _firestore;

  static String get adsCarouselKey => 'ads_carousel';

  CollectionReference<CarouselAd> get _adsRef => _firestore
      .collection(adsCarouselKey)
      .withConverter<CarouselAd>(
        fromFirestore: (snap, _) =>
            CarouselAd.fromJson(Map<String, dynamic>.from(snap.data()!)),
        toFirestore: (ad, _) => ad.toJson(),
      );

  Future<List<CarouselAd>> fetchAds(CategoryId categoryId) async {
    final snap = await _adsRef.where('categoryId', isEqualTo: categoryId).get();
    return snap.docs.map((d) => d.data()).toList();
  }

  Stream<List<CarouselAd>> watchAds(CategoryId categoryId) {
    return _adsRef
        .where('categoryId', isEqualTo: categoryId)
        .snapshots()
        .map((snap) => snap.docs.map((d) => d.data()).toList());
  }

  Future<List<CarouselAd>> fetchAdsBySubCategory(
    CategoryId categoryId,
    SubCategoryId subCategoryId,
  ) async {
    final snap = await _adsRef
        .where('categoryId', isEqualTo: categoryId)
        .where('subCategoryId', isEqualTo: subCategoryId)
        .get();
    return snap.docs.map((d) => d.data()).toList();
  }

  Stream<List<CarouselAd>> watchAdsBySubCategory(
    CategoryId categoryId,
    SubCategoryId subCategoryId,
  ) {
    return _adsRef
        .where('categoryId', isEqualTo: categoryId)
        .where('subCategoryId', isEqualTo: subCategoryId)
        .snapshots()
        .map((snap) => snap.docs.map((d) => d.data()).toList());
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
  return AdsCarouselRepository(FirebaseFirestore.instance);
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
