import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/home/domain/carousel_ad.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ads_carousel_repository.g.dart';

class CategoriesRepository {
  static String get categoriesKey => 'ads_carousel';

  Future<List<CarouselAd>> fetchHighPriorityCarouselAds() async {
    throw UnimplementedError();
  }

  Future<List<CarouselAd>> fetchMediumPriorityCarouselAds(int id) async {
    throw UnimplementedError();
  }

  Future<List<CarouselAd>> fetchLowPriorityCarouselAds() async {
    throw UnimplementedError();
  }

  Stream<List<CarouselAd>> watchHighPriorityCarouselAds() {
    throw UnimplementedError();
  }

  Stream<List<CarouselAd>> watchMediumPriorityCarouselAds() {
    throw UnimplementedError();
  }

  Stream<List<CarouselAd>> watchLowPriorityCarouselAds() {
    throw UnimplementedError();
  }
}

@Riverpod(keepAlive: true)
CategoriesRepository categoriesRepository(Ref ref) {
  return CategoriesRepository();
}

@riverpod
Stream<List<Category>> categoriesListStream(Ref ref) {
  final categoriesRepository = ref.watch(categoriesRepositoryProvider);
  return categoriesRepository.watchCategoriesList();
}

@riverpod
Future<List<Category>> categoriesListFuture(Ref ref) {
  final categoriesRepository = ref.watch(categoriesRepositoryProvider);
  return categoriesRepository.fetchCategoriesList();
}

@riverpod
Stream<Category?> categoryStream(Ref ref, int id) {
  final categoriesRepository = ref.watch(categoriesRepositoryProvider);
  return categoriesRepository.watchCategory(id);
}

@riverpod
Future<Category?> categoryFuture(Ref ref, int id) {
  final categoriesRepository = ref.watch(categoriesRepositoryProvider);
  return categoriesRepository.fetchCategory(id);
}
