import 'package:app/src/core/common_widgets/responsive_center.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/features/home_detail/domain/review.dart';
import 'package:app/src/features/home_detail/presentation/review_list_screen.dart';
import 'package:app/src/features/home_detail/presentation/widgets/rating_graph.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:timeago/timeago.dart' as timeago;

class ReviewSection extends StatelessWidget {
  final EntityDetail entity;
  final List<Review> reviews;
  const ReviewSection({
    super.key,
    required this.isSmall,
    required this.entity,
    required this.reviews,
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
        pageBuilder: (_, __, ___) {
          return Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: screenSize.width * 0.45,
              height: double.infinity,
              child: ReviewListScreen(entity: entity),
            ),
          );
        },
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          fullscreenDialog: true,
          builder: (context) => ReviewListScreen(entity: entity),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
          child: Column(
            spacing: Sizes.p8,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(child: Icon(Icons.person)),
                  gapW12,
                  ReviewRightDetails(review: review),
                ],
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }
}

class ReviewRightDetails extends StatelessWidget {
  const ReviewRightDetails({super.key, required this.review});

  final Review review;

  @override
  Widget build(BuildContext context) {
    final timeAgo = timeago.format(review.updatedAt);

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: Sizes.p8,
            runSpacing: Sizes.p4,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TODO: Replace with user name when available
                  // For now, using userId as a placeholder
                  Text(
                    review.userId,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    timeAgo,
                    style: TextStyle(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              RatingBarIndicator(
                rating: review.rating,
                itemCount: 5,
                itemSize: 18.0,
                itemBuilder: (context, _) =>
                    Icon(Icons.star, color: Colors.amber),
              ),
            ],
          ),
          gapH4,
          Text(review.comment),
        ],
      ),
    );
  }
}
