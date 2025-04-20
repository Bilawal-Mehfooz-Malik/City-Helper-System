import 'package:app/src/features/home/domain/filters/entity_filter.dart';
import 'package:app/src/core/models/my_data_types.dart';

class FoodFilter extends EntityFilter {
  const FoodFilter({
    super.isOpen = false,
    super.ratingSort = SortOrder.none,
    super.genderPref = GenderPreference.any,
  });

  @override
  FoodFilter copyWith({
    bool? isOpen,
    bool? isFurnished,
    SortOrder? priceSort,
    SortOrder? ratingSort,
    GenderPreference? genderPref,
  }) {
    return FoodFilter(
      isOpen: isOpen ?? this.isOpen,
      ratingSort: ratingSort ?? this.ratingSort,
      genderPref: genderPref ?? this.genderPref,
    );
  }
}
