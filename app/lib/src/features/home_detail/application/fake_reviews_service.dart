// import 'package:app/src/core/models/my_data_types.dart';
// import 'package:app/src/features/auth/data/auth_repository.dart';
// import 'package:app/src/features/home/data/fake/fake_food_repository.dart';
// import 'package:app/src/features/home/data/fake/fake_residence_repository.dart';
// import 'package:app/src/features/home_detail/application/reviews_service.dart';
// import 'package:app/src/features/home_detail/data/reviews_repository.dart';
// import 'package:app/src/features/home_detail/domain/review.dart';
// import 'package:app/src/localization/string_hardcoded.dart';

// class FakeReviewsService implements ReviewsService {
//   const FakeReviewsService({
//     required this.fakeResidenceRepository,
//     required this.fakeFoodRepository,
//     required this.authRepository,
//     required this.reviewsRepository,
//   });
//   // * since this is a "fake" reviews service, it relies on some methods that
//   // * are only implemented in the [FakeProductsRepository], but not on the
//   // * [ProductsRepository] base class
//   final FakeResidenceRepository fakeResidenceRepository;
//   final FakeFoodRepository fakeFoodRepository;
//   final AuthRepository authRepository;
//   final ReviewsRepository reviewsRepository;

//   @override
//   Future<void> submitReview({
//     required EntityId entityId,
//     required Review review,
//     required CategoryId categoryId,
//   }) async {
//     final user = authRepository.currentUser;
//     // * we should only call this method when the user is signed in
//     assert(user != null);
//     if (user == null) {
//       throw AssertionError(
//         'Can\'t submit a review if the user is not signed in'.hardcoded,
//       );
//     }
//     await reviewsRepository.addReview(entityId, review);
//     // * Note: this should be done on the backend
//     // * At this stage the review is already submitted
//     // * and we don't need to await for the product rating to also be updated
//     _updateEntityRating(entityId, categoryId);
//   }

//   Future<void> _updateEntityRating(
//     EntityId entityId,
//     CategoryId categoryId,
//   ) async {
//     final reviews = await reviewsRepository.fetchReviewsList(entityId);
//     final avgRating = _avgReviewScore(reviews);
//     if (categoryId == 1) {
//       final entity = fakeResidenceRepository.fetchResidence(
//         categoryId,
//         entityId,
//       );
//     } else {
//       final entity = fakeFoodRepository.fetchFood(categoryId, entityId);
//     }
//     if (product == null) {
//       throw StateError('Product not found with id: $entityId.'.hardcoded);
//     }
//     final updated = entity.copyWith(
//       avgRating: avgRating,
//       numRatings: reviews.length,
//     );
//     if (categoryId == 1) {
//       await fakeResidenceRepository.setProduct(updated);
//     } else {
//       await fakeFoodRepository.setProduct(updated);
//     }
//   }

//   double _avgReviewScore(List<Review> reviews) {
//     if (reviews.isNotEmpty) {
//       var total = 0.0;
//       for (var review in reviews) {
//         total += review.rating;
//       }
//       return total / reviews.length;
//     } else {
//       return 0.0;
//     }
//   }
// }
