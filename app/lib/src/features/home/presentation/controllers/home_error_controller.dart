import 'package:app/src/features/home/application/entities_notifier.dart';
import 'package:app/src/features/home/data/real/ads_carousel_repository.dart';
import 'package:app/src/features/home/data/real/sub_categories_repository.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_error_controller.g.dart';

@riverpod
AsyncError<void>? criticalErrorStatus(Ref ref, {required int categoryId}) {
  final entitiesState = ref.watch(entitiesNotifierProvider(categoryId));
  // A critical error occurs if the initial fetch failed and there are no entities.
  if (entitiesState.entities.isEmpty && entitiesState.paginationError != null) {
    return AsyncError(entitiesState.paginationError!, StackTrace.current);
  }
  return null;
}

@riverpod
List<String> nonCriticalErrors(Ref ref, {required int categoryId}) {
  final errors = <String>[];

  final subCategoryValue = ref.watch(
    subCategoriesListStreamProvider(categoryId),
  );
  if (subCategoryValue.hasError) {
    errors.add('Could not load sub-categories.'.hardcoded);
  }

  final adsValue = ref.watch(adsListFutureProvider(categoryId));
  if (adsValue.hasError) {
    errors.add('Could not load ads.'.hardcoded);
  }

  return errors;
}
