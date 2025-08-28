import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/features/home_detail/presentation/controllers/rating_filter_controller.dart';
import 'package:app/src/features/home_detail/presentation/controllers/review_sort_controller.dart';
import 'package:app/src/features/home_detail/presentation/widgets/rating_graph.dart';
import 'package:app/src/features/home_detail/presentation/widgets/review_section.dart'; // Contains ReviewListTile
import 'package:app/src/features/review/application/paginated_reviews_notifier.dart';
import 'package:app/src/features/review/domain/review_sorting.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReviewListScreen extends ConsumerStatefulWidget {
  final EntityDetail entity;
  const ReviewListScreen({super.key, required this.entity});

  @override
  ConsumerState<ReviewListScreen> createState() => _ReviewListScreenState();
}

class _ReviewListScreenState extends ConsumerState<ReviewListScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      final sortOption = ref.read(reviewSortControllerProvider);
      final ratingFilter = ref.read(ratingFilterControllerProvider);
      ref
          .read(
            paginatedReviewsNotifierProvider(
              entityId: widget.entity.id,
              sortOption: sortOption,
              ratingFilter: ratingFilter,
            ).notifier,
          )
          .fetchNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ratingFilter = ref.watch(ratingFilterControllerProvider);
    final sortOption = ref.watch(reviewSortControllerProvider);
    final reviewsValue = ref.watch(
      paginatedReviewsNotifierProvider(
        entityId: widget.entity.id,
        sortOption: sortOption,
        ratingFilter: ratingFilter,
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(context.loc.reviews)),
      body: SafeArea(
        child: AsyncValueWidget(
          // Wrap the whole CustomScrollView in AsyncValueWidget
          value: reviewsValue,
          data: (paginationState) {
            final reviews = paginationState.reviews;
            return CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverPadding(
                  // Apply padding to the whole scroll view
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.p16,
                    vertical: Sizes.p4,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      RatingGraph(entity: widget.entity),
                      gapH8,
                      _RatingFilterChips(),
                      gapH8,
                      _SortRow(),
                      gapH16,
                    ]),
                  ),
                ),
                if (reviews.isEmpty) // Use SliverFillRemaining for empty state
                  SliverFillRemaining(
                    hasScrollBody: false, // Important for centering
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: Sizes.p24),
                      child: Center(
                        child: Text(
                          context.loc.no_reviews_found,
                          style: context.textTheme.bodyLarge,
                        ),
                      ),
                    ),
                  )
                else
                  SliverPadding(
                    // New SliverPadding for reviews list
                    padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          if (index == reviews.length) {
                            // Loading indicator or error message for next page
                            if (paginationState.isLoadingNextPage) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (paginationState.paginationError !=
                                null) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: Sizes.p16,
                                ),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        context.loc.error_loading_more_reviews,
                                      ),
                                      gapH8,
                                      ElevatedButton(
                                        onPressed: () {
                                          ref
                                              .read(
                                                paginatedReviewsNotifierProvider(
                                                  entityId: widget.entity.id,
                                                  sortOption: sortOption,
                                                  ratingFilter: ratingFilter,
                                                ).notifier,
                                              )
                                              .fetchNextPage();
                                        },
                                        child: Text(context.loc.retry),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                            return const SizedBox.shrink(); // Should not happen if hasMore is false
                          }
                          final review = reviews[index];
                          return ReviewListTile(review: review);
                        },
                        childCount:
                            reviews.length +
                            (paginationState.isLoadingNextPage ||
                                    paginationState.paginationError != null
                                ? 1
                                : 0),
                      ),
                    ),
                  ),
              ],
            );
          },
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

    String getSortLabel(ReviewSortOption option) {
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
        PopupMenuButton<ReviewSortOption>(
          // Removed nullable option
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
