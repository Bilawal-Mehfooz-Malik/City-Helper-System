import 'package:app/src/features/review/domain/review_sorting.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'review_sort_controller.g.dart';

@riverpod
class ReviewSortController extends _$ReviewSortController {
  @override
  ReviewSortOption build() => ReviewSortOption.latest;

  void setSort(ReviewSortOption option) {
    state = option;
  }
}
