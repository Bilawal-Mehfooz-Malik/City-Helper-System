import 'package:app/src/features/home/application/entity_service.dart';
import 'package:app/src/features/home/data/real/ads_carousel_repository.dart';
import 'package:app/src/features/home/data/real/sub_categories_repository.dart';
import 'package:app/src/features/home/presentation/controllers/subcategory_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'combined_error_controller.g.dart';

@riverpod
AsyncError<void>? combinedErrorStatus(Ref ref, {required int categoryId}) {
  final subCategoryId = ref.watch(subcategoryControllerProvider);

  // TODO: Only show error if failed to fetches Entities List
  final providers = [
    ref.watch(subCategoriesListStreamProvider(categoryId)),
    ref.watch(adsListFutureProvider(categoryId)),
    ref.watch(watchEntitiesProvider(categoryId, subCategoryId)),
    ref.watch(watchEntitiesProvider(categoryId, subCategoryId)),
  ];

  for (final result in providers) {
    if (result.hasError) {
      return AsyncError(result.error!, StackTrace.current);
    }
  }
  return null;
}
