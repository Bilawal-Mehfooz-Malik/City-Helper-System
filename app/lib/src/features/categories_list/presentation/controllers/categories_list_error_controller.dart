import 'package:app/src/features/categories_list/data/categories_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories_list_error_controller.g.dart';

@riverpod
AsyncError<void>? categoriesListErrorStatus(Ref ref) {
  final provider = ref.watch(categoriesListFutureProvider);

  if (provider.hasError) {
    return AsyncError(provider.error!, StackTrace.current);
  }

  return null;
}
