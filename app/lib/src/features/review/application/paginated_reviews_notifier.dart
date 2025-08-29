import 'dart:async';

import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/review/data/reviews_repository.dart';
import 'package:app/src/features/review/domain/review.dart';
import 'package:app/src/features/review/domain/review_pagination_state.dart';
import 'package:app/src/features/review/domain/review_sorting.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'paginated_reviews_notifier.g.dart';

const _reviewsPerPage = 3;

@riverpod
class PaginatedReviewsNotifier extends _$PaginatedReviewsNotifier {
  @override
  Future<ReviewPaginationState> build({
    required EntityId entityId,
    ReviewSortOption sortOption = ReviewSortOption.latest,
    int? ratingFilter,
  }) async {
    final reviews = await _fetchPage(limit: _reviewsPerPage);

    return ReviewPaginationState(
      reviews: reviews,
      hasMore: reviews.length == _reviewsPerPage,
    );
  }

  Future<List<Review>> _fetchPage({required int limit, List<dynamic>? cursor}) {
    final reviewsRepo = ref.read(reviewsRepositoryProvider);
    // The build method's parameters are automatically passed to the notifier.
    return reviewsRepo.fetchPaginatedReviews(
      entityId: entityId,
      sortOption: sortOption,
      ratingFilter: ratingFilter,
      limit: limit,
      cursor: cursor,
    );
  }

  Future<void> fetchNextPage() async {
    final currentState = state.value;
    if (currentState == null ||
        !currentState.hasMore ||
        currentState.isLoadingNextPage) {
      return;
    }

    state = AsyncData(
      currentState.copyWith(
        isLoadingNextPage: true,
        clearPaginationError: true,
      ),
    );

    try {
      final lastReview = currentState.reviews.last;
      final cursor = _getCursorFromReview(lastReview);

      final newReviews = await _fetchPage(
        limit: _reviewsPerPage,
        cursor: cursor,
      );

      state = AsyncData(
        currentState.copyWith(
          reviews: [...currentState.reviews, ...newReviews],
          hasMore: newReviews.length == _reviewsPerPage,
          isLoadingNextPage: false,
        ),
      );
    } catch (e) {
      state = AsyncData(
        currentState.copyWith(isLoadingNextPage: false, paginationError: e),
      );
    }
  }

  List<dynamic> _getCursorFromReview(Review review) {
    switch (sortOption) {
      case ReviewSortOption.latest:
      case ReviewSortOption.oldest:
        return [review.updatedAt, review.userId];
      case ReviewSortOption.highest:
      case ReviewSortOption.lowest:
        return [review.rating, review.updatedAt, review.userId];
    }
  }
}
