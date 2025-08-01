import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'review_sort_controller.g.dart';

enum ReviewSortOption { latest, oldest, highest, lowest }

@riverpod
class ReviewSortController extends _$ReviewSortController {
  @override
  ReviewSortOption? build() => null;

  void setSort(ReviewSortOption? option) {
    state = option;
  }
}
