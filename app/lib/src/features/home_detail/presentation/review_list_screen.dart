import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/common_widgets/responsive_scrollable.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home_detail/data/reviews_repository.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/features/home_detail/domain/review.dart';
import 'package:app/src/features/home_detail/presentation/controllers/rating_filter_controller.dart';
import 'package:app/src/features/home_detail/presentation/controllers/review_sort_controller.dart';
import 'package:app/src/features/home_detail/presentation/widgets/rating_graph.dart';
import 'package:app/src/features/home_detail/presentation/widgets/review_section.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReviewListScreen extends ConsumerWidget {
  final EntityDetail entity;
  const ReviewListScreen({super.key, required this.entity});

  List<Review> _filterReviewsByRating(
    List<Review> reviews,
    int? selectedRating,
  ) {
    if (selectedRating == null) return reviews;

    return reviews.where((r) {
      final rating = r.rating;
      switch (selectedRating) {
        case 1:
          return rating < 2.0;
        case 2:
          return rating >= 2.0 && rating < 3.0;
        case 3:
          return rating >= 3.0 && rating < 4.0;
        case 4:
          return rating >= 4.0 && rating < 5.0;
        case 5:
          return rating >= 5.0;
        default:
          return true;
      }
    }).toList();
  }

  List<Review> _sortReviews(
    List<Review> reviews,
    ReviewSortOption? sortOption,
  ) {
    if (sortOption == null) return reviews;
    final sorted = [...reviews];
    switch (sortOption) {
      case ReviewSortOption.latest:
        sorted.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
        break;
      case ReviewSortOption.oldest:
        sorted.sort((a, b) => a.updatedAt.compareTo(b.updatedAt));
        break;
      case ReviewSortOption.highest:
        sorted.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case ReviewSortOption.lowest:
        sorted.sort((a, b) => a.rating.compareTo(b.rating));
        break;
    }
    return sorted;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewsValue = ref.watch(fetchReviewsListProvider(entity.id));
    final selectedFilter = ref.watch(ratingFilterControllerProvider);
    final sortOption = ref.watch(reviewSortControllerProvider);

    return Scaffold(
      appBar: AppBar(title: Text(context.loc.reviews)),
      body: SafeArea(
        child: ResponsiveScrollable(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.p16,
            vertical: Sizes.p4,
          ),
          child: AsyncValueWidget(
            value: reviewsValue,
            data: (reviews) {
              final filteredReviews = _filterReviewsByRating(
                reviews,
                selectedFilter,
              );
              final sortedReviews = _sortReviews(filteredReviews, sortOption);

              return Column(
                spacing: Sizes.p8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingGraph(entity: entity),

                  _RatingFilterChips(),
                  _SortRow(),
                  if (sortedReviews.isEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: Sizes.p24),
                      child: Center(
                        child: Text(
                          context.loc.no_reviews_found,
                          style: context.textTheme.bodyLarge,
                        ),
                      ),
                    )
                  else
                    ReviewsListView(reviews: sortedReviews),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _RatingFilterChips extends ConsumerWidget {
  void updateFilter(int? rating, WidgetRef ref) {
    ref.read(ratingFilterControllerProvider.notifier).setFilter(rating);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(ratingFilterControllerProvider);

    return Wrap(
      spacing: Sizes.p8,
      runSpacing: Sizes.p8,
      children: [
        FilterChip(
          label: Text(context.loc.all),
          selected: selected == null,
          onSelected: (_) => updateFilter(null, ref),
        ),
        for (int i = 5; i >= 1; i--)
          FilterChip(
            label: Text('$i Star'.hardcoded),
            selected: selected == i,
            onSelected: (_) => updateFilter(i, ref),
          ),
      ],
    );
  }
}

class _SortRow extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSort = ref.watch(reviewSortControllerProvider);

    String getSortLabel(ReviewSortOption? option) {
      if (option == null) return context.loc.filtersTitle;
      switch (option) {
        case ReviewSortOption.latest:
          return context.loc.latest;
        case ReviewSortOption.oldest:
          return context.loc.oldest;
        case ReviewSortOption.highest:
          return context.loc.highest_rating;
        case ReviewSortOption.lowest:
          return context.loc.lowest_rating;
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(getSortLabel(selectedSort), style: context.textTheme.titleMedium),
        PopupMenuButton<ReviewSortOption?>(
          icon: const Icon(Icons.filter_list),
          tooltip: context.loc.filtersTitle,
          onSelected: (value) {
            ref.read(reviewSortControllerProvider.notifier).setSort(value);
          },
          itemBuilder: (context) => [
            ...ReviewSortOption.values.map(
              (option) => PopupMenuItem<ReviewSortOption>(
                value: option,
                child: Text(getSortLabel(option)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
