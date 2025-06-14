import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rating_filter_controller.g.dart';

@riverpod
class RatingFilterController extends _$RatingFilterController {
  @override
  int? build() => null;

  void setFilter(int? rating) => state = rating;
}
