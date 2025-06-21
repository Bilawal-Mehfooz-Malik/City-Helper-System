import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/core/common_widgets/responsive_scrollable.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/async_value_ui.dart';
import 'package:app/src/features/review/presentation/leave_review_controller.dart';
import 'package:app/src/features/review/domain/review.dart';
import 'package:app/src/features/home_detail/presentation/widgets/entity_rating_bar.dart';
import 'package:app/src/features/review/data/reviews_repository.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LeaveReviewScreen extends ConsumerWidget {
  const LeaveReviewScreen({
    super.key,
    required this.entityId,
    required this.categoryId,
  });

  final EntityId entityId;
  final CategoryId categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userReviewAsync = ref.watch(userReviewFutureProvider(entityId));

    return Scaffold(
      appBar: AppBar(title: Text(context.loc.leaveAREview)),
      body: AsyncValueWidget(
        value: userReviewAsync,
        data: (review) => ResponsiveScrollable(
          maxContentWidth: Breakpoint.tablet,
          padding: const EdgeInsets.all(Sizes.p16),
          child: LeaveReviewForm(
            entityId: entityId,
            categoryId: categoryId,
            review: review,
          ),
        ),
      ),
    );
  }
}

class LeaveReviewForm extends ConsumerStatefulWidget {
  const LeaveReviewForm({
    super.key,
    required this.entityId,
    required this.categoryId,
    this.review,
  });

  final EntityId entityId;
  final CategoryId categoryId;
  final Review? review;

  static const reviewCommentKey = Key('reviewComment');

  @override
  ConsumerState<LeaveReviewForm> createState() => _LeaveReviewFormState();
}

class _LeaveReviewFormState extends ConsumerState<LeaveReviewForm> {
  final _controller = TextEditingController();
  double _rating = 0;
  bool _initialized = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Show error dialog if needed
    ref.listen<AsyncValue<void>>(
      leaveReviewControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    final state = ref.watch(leaveReviewControllerProvider);

    // Prefill comment & rating (only once)
    if (!_initialized && widget.review != null) {
      _controller.text = widget.review!.comment;
      _rating = widget.review!.rating;
      _initialized = true;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.review != null)
          Text(context.loc.reviewedBeforeContent, textAlign: TextAlign.center),
        gapH24,
        Center(
          child: EntityRatingBar(
            initialRating: _rating,
            onRatingUpdate: (rating) => setState(() => _rating = rating),
          ),
        ),
        gapH32,
        TextField(
          key: LeaveReviewForm.reviewCommentKey,
          controller: _controller,
          textCapitalization: TextCapitalization.sentences,
          maxLines: 5,
          decoration: InputDecoration(
            labelText: context.loc.yourReview,
            border: const OutlineInputBorder(),
          ),
        ),
        gapH32,
        PrimaryButton(
          isLoading: state.isLoading,
          isDisabled: _rating == 0,
          text: widget.review != null ? context.loc.update : context.loc.submit,
          onPressed: state.isLoading
              ? null
              : () => ref
                    .read(leaveReviewControllerProvider.notifier)
                    .submitReview(
                      entityId: widget.entityId,
                      categoryId: widget.categoryId,
                      rating: _rating,
                      comment: _controller.text,
                      previousReview: widget.review,
                      onSuccess: () => Navigator.of(context).pop(),
                    ),
        ),
      ],
    );
  }
}
