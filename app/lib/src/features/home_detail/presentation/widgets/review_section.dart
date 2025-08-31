import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/common_widgets/custom_image.dart';
import 'package:app/src/core/common_widgets/responsive_center.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/auth/data/user_repository.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/features/review/domain/review.dart';
import 'package:app/src/features/review/presentation/review_list_screen.dart';
import 'package:app/src/features/home_detail/presentation/widgets/rating_graph.dart';
import 'package:app/src/features/review/presentation/review_skeleton.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/routers/app_router.dart';
import 'package:app/src/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:timeago/timeago.dart' as timeago;

class ReviewSection extends StatelessWidget {
  final EntityDetail entity;
  final List<Review> reviews;
  final bool reviewsLoadFailed; // New parameter
  const ReviewSection({
    super.key,
    required this.isSmall,
    required this.entity,
    required this.reviews,
    required this.reviewsLoadFailed, // New parameter
  });

  final bool isSmall;
  void _goToReviewList(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final screenType = ScreenType.determine(
      width: screenSize.width,
      height: screenSize.height,
    );

    if (screenType == ScreenType.tablet || screenType == ScreenType.desktop) {
      showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: 'Reviews',
        pageBuilder: (_, _, _) {
          return Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: screenSize.width * 0.45,
              height: double.infinity,
              child: ReviewListScreen(
                entityId: entity.id,
                categoryId: entity.categoryId,
              ), // Updated
            ),
          );
        },
      );
    } else {
      context.pushNamed(
        AppRoute.reviewList.name,
        pathParameters: {
          'categoryId': entity.categoryId.toString(),
          'entityId': entity.id,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (reviewsLoadFailed) {
      return const SizedBox.shrink(); // Hide the entire section
    }
    return ResponsiveCenter(
      showCard: isSmall ? false : true,
      paddingInsideCard: isSmall
          ? EdgeInsets.zero
          : EdgeInsets.symmetric(vertical: Sizes.p8, horizontal: Sizes.p16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.loc.ratingAndReviews,
            style: context.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          gapH16,
          InkWell(
            onTap: () => _goToReviewList(context),
            child: RatingGraph(entity: entity),
          ),
          gapH16,
          ReviewsListView(reviews: reviews),
          if (reviews.isNotEmpty)
            Center(
              child: TextButton(
                onPressed: () => _goToReviewList(context),
                child: Text(context.loc.seeMore),
              ),
            ),
        ],
      ),
    );
  }
}

class ReviewsListView extends StatelessWidget {
  const ReviewsListView({super.key, required this.reviews});

  final List<Review> reviews;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: reviews.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final review = reviews[index];
        return ReviewListTile(review: review);
      },
    );
  }
}

class ReviewListTile extends ConsumerWidget {
  const ReviewListTile({super.key, required this.review});

  final Review review;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeAgo = timeago.format(review.updatedAt);
    final userAsync = ref.watch(fetchUserByIdProvider(review.userId));

    return AsyncValueWidget(
      value: userAsync,
      loading: ReviewListTileSkeleton(),
      error: (e, st) => SizedBox.shrink(),
      data: (user) {
        if (user == null) {
          return const SizedBox.shrink();
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: Sizes.p8,
                runSpacing: Sizes.p4,
                children: [
                  Row(
                    children: [
                      SizedBox.square(
                        dimension: 30,
                        child: user.profileImageUrl != null
                            ? ClipOval(
                                child: CustomImage(
                                  fit: BoxFit.cover,
                                  placeholderIconSize: 15,
                                  imageUrl: user.profileImageUrl,
                                  useCircleLoading: true,
                                ),
                              )
                            : const CircleAvatar(
                                radius: 15,
                                child: Icon(Icons.person, size: 16),
                              ),
                      ),

                      gapW12,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            timeAgo,
                            style: TextStyle(
                              color: context.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  RatingBarIndicator(
                    rating: review.rating,
                    itemCount: 5,
                    itemSize: 18.0,
                    itemBuilder: (context, _) =>
                        const Icon(Icons.star, color: amberColor),
                  ),
                ],
              ),
              gapH4,
              Text(review.comment),
              gapH8,
              const Divider(),
            ],
          ),
        );
      },
    );
  }
}
