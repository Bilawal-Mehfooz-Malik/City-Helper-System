import 'package:app/src/features/review/domain/review.dart';

class ReviewPaginationState {
  const ReviewPaginationState({
    this.reviews = const [],
    this.hasMore = true,
    this.isLoadingNextPage = false,
    this.paginationError,
  });

  final List<Review> reviews;
  final bool hasMore;
  final bool isLoadingNextPage;
  final Object? paginationError;

  ReviewPaginationState copyWith({
    List<Review>? reviews,
    bool? hasMore,
    bool? isLoadingNextPage,
    Object? paginationError,
    bool clearPaginationError = false,
  }) {
    return ReviewPaginationState(
      reviews: reviews ?? this.reviews,
      hasMore: hasMore ?? this.hasMore,
      isLoadingNextPage: isLoadingNextPage ?? this.isLoadingNextPage,
      paginationError:
          clearPaginationError ? null : paginationError ?? this.paginationError,
    );
  }
}
